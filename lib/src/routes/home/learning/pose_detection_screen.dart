// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class PoseDetector {
  tfl.Interpreter? _interpreter;

  PoseDetector() {
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      final interpreterOptions = tfl.InterpreterOptions()
        ..threads = 4; // Adjust based on your model and device capabilities
      _interpreter = await tfl.Interpreter.fromAsset(
          'assets/scripts/pose_landmark_lite.tflite',
          options: interpreterOptions);
    } catch (e) {
      log('Failed to load model: $e');
    }
  }

  Future<List<List<double>>?> detectPose(Uint8List imageBytes) async {
    if (_interpreter == null) {
      log('Model not loaded');
      return null;
    }

    // Convert imageBytes to a ui.Image
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      completer.complete(img);
    });
    final ui.Image rawImage = await completer.future;

    // Resize the image to match the model's input size
    final int inputSize = 256; // Adjust size as needed
    final ByteData? byteData = await rawImage.toByteData();
    if (byteData == null) {
      return null;
    }
    final Uint8List resizedBytes = Uint8List.view(byteData.buffer);

    // Preprocess the image: normalize pixel values to range [0, 1]
    final Float32List inputData = Float32List(1 * inputSize * inputSize * 3);
    for (int i = 0; i < resizedBytes.length; i++) {
      inputData[i] = resizedBytes[i] / 255.0;
    }

    // Run inference
    final outputs = List.generate(
        _interpreter!.getOutputTensors().length,
        (index) => Float32List(_interpreter!
            .getOutputTensors()[index]
            .shape
            .reduce((a, b) => a * b)));
    _interpreter!.run([inputData], outputs);

    // Process outputs to get pose landmarks
    final poseLandmarks = processOutputs(outputs);

    return poseLandmarks;
  }

  List<List<double>> processOutputs(List<Float32List> outputs) {
    final List<List<double>> poseLandmarks = [];
    final int numKeypoints =
        outputs[0].length ~/ 3; // Assuming each keypoint has 3 values

    for (int i = 0; i < numKeypoints; i++) {
      final double x = outputs[0][i * 3];
      final double y = outputs[0][i * 3 + 1];
      final double confidence = outputs[0][i * 3 + 2];

      // Check if the confidence score is above a certain threshold
      if (confidence > 0.5) {
        // Adjust threshold as needed
        // Add the keypoint to the list
        poseLandmarks.add([x, y, confidence]);
      }
    }

    // Add placeholders for missing keypoints
    while (poseLandmarks.length < numKeypoints) {
      poseLandmarks.add([0, 0, 0]);
    }

    return poseLandmarks;
  }
}

class PoseDetectionScreen extends StatefulWidget {
  const PoseDetectionScreen({super.key});

  @override
  State<PoseDetectionScreen> createState() => _PoseDetectionScreenState();
}

class _PoseDetectionScreenState extends State<PoseDetectionScreen> {
  CameraController? _cameraController;
  bool _isDetecting = false;
  final PoseDetector _poseDetector = PoseDetector();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _startDetecting() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (_isDetecting) return;

    _isDetecting = true;

    while (_isDetecting) {
      try {
        final XFile image = await _cameraController!.takePicture();
        final imageBytes = await image.readAsBytes();
        final poseLandmarks = await _poseDetector.detectPose(imageBytes);
        if (poseLandmarks != null) {
          // Process pose landmarks and update UI if needed
          log('Pose landmarks: $poseLandmarks');
        }
      } catch (e) {
        log('Error: $e');
      }
    }
  }

  void _stopDetecting() {
    _isDetecting = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container();
    }

    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;

    return Scaffold(
      appBar: AppBar(title: Text('Camera Page')),
      body: Stack(
        children: [
          Transform.scale(
            scale: deviceSize.aspectRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: _cameraController!.value.aspectRatio,
                child: CameraPreview(_cameraController!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: _isDetecting ? _stopDetecting : _startDetecting,
              child: Text(_isDetecting ? 'Stop' : 'Start Detection'),
            ),
          ),
        ],
      ),
    );
  }
}
