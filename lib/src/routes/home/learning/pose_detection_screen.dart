// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class PoseDetectionScreen extends StatefulWidget {
  const PoseDetectionScreen({super.key});

  @override
  State<PoseDetectionScreen> createState() => _PoseDetectionScreenState();
}

class _PoseDetectionScreenState extends State<PoseDetectionScreen> {
  late io.Socket socket;
  List<int> _imageBytes = [];

  @override
  void initState() {
    super.initState();
    socket = io.io('http://your_server_ip:8888', <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on('image', _handleImage);
    socket.connect();
  }

  void _handleImage(data) {
    setState(() {
      _imageBytes = data;
    });
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: Center(
        child: _imageBytes.isEmpty
            ? CircularProgressIndicator()
            : Image.memory(Uint8List.fromList(_imageBytes)),
      ),
    );
  }
}
