import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizeScreen extends StatefulWidget {
  final File image;

  const RecognizeScreen({super.key, required this.image});

  @override
  State<RecognizeScreen> createState() => _RecognizeScreenState();
}

class _RecognizeScreenState extends State<RecognizeScreen> {
  late TextRecognizer textRecognizer;

  String result = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRecognition();
  }

  Future<void> doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    if (!mounted) return;

    setState(() {
      result = recognizedText.text;
      isLoading = false;
    });

    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {}
      }
    }
  }

  @override
  void dispose() {
    textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Recognizer'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(widget.image),
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Row(
                  children: [
                    Text(
                      'result Text',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.copy, color: Colors.white),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          result,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}