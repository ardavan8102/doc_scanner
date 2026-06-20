import 'dart:io';

import 'package:flutter/material.dart';

class RecognizeScreen extends StatefulWidget {
  File? image;

  RecognizeScreen({super.key, this.image});

  @override
  State<RecognizeScreen> createState() => _RecognizeScreenState();
}

class _RecognizeScreenState extends State<RecognizeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Recognizer'),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(widget.image!))
            ),
          ),
        ],
      ),
    );
  }
}