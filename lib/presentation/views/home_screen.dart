import 'package:camera/camera.dart';
import 'package:document_scanner/main.dart';
import 'package:document_scanner/presentation/widgets/bottom_nav.dart';
import 'package:document_scanner/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late CameraController controller;
  bool isCameraReady = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller.initialize();

    if (!mounted) return;

    setState(() {
      isCameraReady = true;
    });
  }

  Future<void> takePicture() async {
    final image = await controller.takePicture();

    await Gal.putImage(image.path);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تصویر در گالری ذخیره شد")),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: .spaceEvenly,
            children: [
              TopBoxBar(),

              // Scanner
              Card(
                color: Colors.black,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: isCameraReady
                      ? CameraPreview(controller)
                      : Center(child: CircularProgressIndicator()),
                ),
              ),

              BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}