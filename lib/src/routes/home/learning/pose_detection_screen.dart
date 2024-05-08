// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:math';
import 'dart:developer' as dev;
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PoseDetectionScreen extends StatefulWidget {
  const PoseDetectionScreen({super.key});

  @override
  State<PoseDetectionScreen> createState() => _PoseDetectionScreenState();
}

class _PoseDetectionScreenState extends State<PoseDetectionScreen> {
  late PoseDetector _poseDetector;
  bool _isProcessing = false;
  bool _initialStanceDetected = false;
  bool _finalPoseDetected = false;
  bool _cooldownActive = false;
  late double _cooldownTimer;
  final double _cooldownDuration = 5.0;
  final List<double> _thresholds = [50.0, 50.0, 40.0, 10.0];

  late Future<CameraController> _cameraControllerFuture;

  @override
  void initState() {
    _cameraControllerFuture = _initializeCamera();
    _initializePoseDetector();
    super.initState();
  }

  @override
  void dispose() {
    _poseDetector.close();
    super.dispose();
  }

  Future<CameraController> _initializeCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraController cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await cameraController.initialize();
    cameraController.startImageStream(_processImage);
    return cameraController;
  }

  void _initializePoseDetector() {
    _poseDetector = PoseDetector(
      options: PoseDetectorOptions(
        mode: PoseDetectionMode.stream,
        model: PoseDetectionModel.base,
      ),
    );
  }

  Future<void> _processImage(CameraImage image) async {
    if (_isProcessing) {
      return;
    }

    _isProcessing = true;
    // Image dimension, ByteBuffer size and format
    final inputImage = InputImage.fromBytes(
      bytes: image.planes.first.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotation.rotation90deg,
        format: InputImageFormat.yuv_420_888,
        bytesPerRow: image.planes.first.bytesPerRow,
      ),
    );
    dev.log('Image dimensions: ${image.width} x ${image.height}');
    dev.log('Image format: ${image.format}');
    dev.log('Bytes per row: ${image.planes.first.bytesPerRow}');

    final poses = await _poseDetector.processImage(inputImage);

    if (poses.isNotEmpty) {
      final pose = poses.first;
      final landmarks = pose.landmarks.values.toList();
      _checkInitialStance(landmarks);
      _checkFinalPose(landmarks);
      _processAndDrawPose(landmarks);
    }

    _isProcessing = false;
  }

  void _checkInitialStance(List<PoseLandmark> landmarks) {
    if (landmarks.length >= 16) {
      final wristY = landmarks[15].y;
      final elbowY = landmarks[14].y;
      _initialStanceDetected = wristY < elbowY;
    } else {
      _initialStanceDetected = false;
    }
  }

  void _checkFinalPose(List<PoseLandmark> landmarks) {
    if (_initialStanceDetected && !_finalPoseDetected) {
      if (_initialStance(landmarks)) {
        if (_angleThreshold(landmarks, [11, 13, 15], [12, 14, 16], [13, 11, 23],
            [14, 12, 24], _thresholds)) {
          _finalPoseDetected = true;
          _cooldownActive = true;
          _cooldownTimer = DateTime.now().millisecondsSinceEpoch +
              (_cooldownDuration * 1000).toDouble();
        }
      }
    }
  }

  bool _initialStance(List<PoseLandmark> landmarks) {
    if (landmarks.length >= 16) {
      final wristY = landmarks[15].y;
      final elbowY = landmarks[14].y;
      return wristY < elbowY;
    }
    return false;
  }

  bool _angleThreshold(
      List<PoseLandmark> landmarks,
      List<int> indices1,
      List<int> indices2,
      List<int> indices3,
      List<int> indices4,
      List<double> thresholds) {
    final angles = [
      _calculateAngle(landmarks[indices1[0]], landmarks[indices1[1]],
          landmarks[indices1[2]]),
      _calculateAngle(landmarks[indices2[0]], landmarks[indices2[1]],
          landmarks[indices2[2]]),
      _calculateAngle(landmarks[indices3[0]], landmarks[indices3[1]],
          landmarks[indices3[2]]),
      _calculateAngle(landmarks[indices4[0]], landmarks[indices4[1]],
          landmarks[indices4[2]]),
    ];

    return angles.every((angle) => angle > thresholds[angles.indexOf(angle)]);
  }

  double _calculateAngle(PoseLandmark p1, PoseLandmark p2, PoseLandmark p3) {
    final radians =
        atan2(p3.y - p2.y, p3.x - p2.x) - atan2(p1.y - p2.y, p1.x - p2.x);
    return (radians * 180 / pi + 360) % 360;
  }

  void _processAndDrawPose(List<PoseLandmark> landmarks) {
    if (!_initialStanceDetected) {
      _initialStanceDetected = _initialStance(landmarks);
      if (!_initialStanceDetected) {
        // Reset the pose detection if the initial stance is lost for too long
        if (DateTime.now().millisecondsSinceEpoch - _cooldownTimer > 5000) {
          _initialStanceDetected = false;
          _finalPoseDetected = false;
          _cooldownTimer = DateTime.now().millisecondsSinceEpoch +
              (_cooldownDuration * 1000).toDouble();
        }
      }
    } else {
      if (!_finalPoseDetected) {
        if (_initialStance(landmarks)) {
          if (_angleThreshold(landmarks, [11, 13, 15], [12, 14, 16],
              [13, 11, 23], [14, 12, 24], _thresholds)) {
            _finalPoseDetected = true;
            _cooldownActive = true;
            _cooldownTimer = DateTime.now().millisecondsSinceEpoch +
                (_cooldownDuration * 1000).toDouble();
          }
        }
      } else {
        if (DateTime.now().millisecondsSinceEpoch > _cooldownTimer) {
          _cooldownActive = false;
        }

        if (!_cooldownActive) {
          if (!_initialStance(landmarks)) {
            _initialStanceDetected = false;
            _finalPoseDetected = false;
            _cooldownTimer = DateTime.now().millisecondsSinceEpoch +
                (_cooldownDuration * 1000).toDouble();
          } else {
            final angles = [
              _calculateAngle(landmarks[24], landmarks[26], landmarks[28]),
              _calculateAngle(landmarks[12], landmarks[24], landmarks[26]),
              _calculateAngle(landmarks[12], landmarks[14], landmarks[16]),
              _calculateAngle(landmarks[11], landmarks[23], landmarks[25]),
              _calculateAngle(landmarks[26], landmarks[28], landmarks[32]),
              _calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
              _calculateAngle(landmarks[25], landmarks[27], landmarks[31]),
            ];

            final interpolatedAngles = angles.map((angle) {
              final src = [
                193.0,
                218.0,
                195.0,
                180.0,
                12.0,
                58.0,
                150.0,
                148.0,
                160.0,
                100.0,
                330.0,
                175.0,
                100.0,
                103.0
              ];
              final dst = [
                0.0,
                100.0,
                0.0,
                100.0,
                0.0,
                100.0,
                0.0,
                100.0,
                0.0,
                100.0,
                0.0,
                100.0,
                0.0,
                100.0
              ];
              return ui
                      .lerpDouble(src[angles.indexOf(angle)],
                          dst[angles.indexOf(angle)], angle / 360)
                      ?.toDouble() ??
                  0.0;
            }).toList();

            final avgAngle = interpolatedAngles.isNotEmpty
                ? interpolatedAngles.reduce((a, b) => a + b) /
                    interpolatedAngles.length
                : 0.0;

            final maxBarHeight = 100.0;
            final whiteRectHeight = maxBarHeight * 2;
            final whiteRectTop = 400.0 - whiteRectHeight;
            final borderThickness = 6.0;

            setState(() {
              customPaint = CustomPaint(
                painter: PosePainter(
                  landmarks: landmarks,
                  avgAngle: avgAngle,
                  maxBarHeight: maxBarHeight,
                  whiteRectTop: whiteRectTop,
                  borderThickness: borderThickness,
                ),
              );
            });

            if (avgAngle <= 10) {
              dev.log('Angles when avg_angle <= 10:');
              dev.log('$angles');
            }
          }
        }
      }
    }
  }

  CustomPaint? customPaint;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double aspectRatio = screenSize.width / screenSize.height;

    return Scaffold(
      body: FutureBuilder<CameraController>(
        future: _cameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Transform.scale(
                scale: 1.0,
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: CameraPreview(snapshot.data!),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // Rest of the UI code remains the same
    );
  }
}

class PosePainter extends CustomPainter {
  final List<PoseLandmark> landmarks;
  final double avgAngle;
  final double maxBarHeight;
  final double whiteRectTop;
  final double borderThickness;

  PosePainter({
    required this.landmarks,
    required this.avgAngle,
    required this.maxBarHeight,
    required this.whiteRectTop,
    required this.borderThickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the white rectangle
    paint.color = Colors.white;
    canvas.drawRect(
      Rect.fromLTWH(
        10 - borderThickness,
        whiteRectTop - borderThickness,
        90 + 2 * borderThickness,
        maxBarHeight * 2 + 2 * borderThickness,
      ),
      paint,
    );

    // Draw the green/red bar
    final barHeight = avgAngle * 2;
    final barTop = 400.0 - barHeight;
    paint.color = barHeight > 1.7 * maxBarHeight ? Colors.red : Colors.green;
    canvas.drawRect(
      Rect.fromLTWH(10, barTop, 80, barHeight),
      paint,
    );

    // Draw the text if the bar height surpasses 170%
    if (barHeight > 1.7 * maxBarHeight) {
      final textSpan = TextSpan(
        text: 'Correct Pose',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: ui.TextDirection.ltr,
      )..layout(
          minWidth: 0,
          maxWidth: size.width,
        );
      final textX = (size.width - textPainter.width) / 2;
      final textY = size.height - 50;
      textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.landmarks != landmarks ||
        oldDelegate.avgAngle != avgAngle ||
        oldDelegate.maxBarHeight != maxBarHeight ||
        oldDelegate.whiteRectTop != whiteRectTop ||
        oldDelegate.borderThickness != borderThickness;
  }
}
