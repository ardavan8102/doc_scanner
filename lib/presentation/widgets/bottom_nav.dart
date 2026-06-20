import 'dart:io';

import 'package:document_scanner/presentation/views/recognize_screen.dart';
import 'package:document_scanner/presentation/widgets/bottom_nav_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late ImagePicker imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[800],
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .center,
          children: [
            BottomNavBarIconButton(
              icon: Icons.rotate_left,
              size: 32,
              function: () {
                
              },
            ),
    
    
            BottomNavBarIconButton(
              icon: Icons.camera,
              function: () {
                
              },
            ),
    
            BottomNavBarIconButton(
              icon: Icons.image_outlined,
              size: 32,
              function: () async {
                XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

                if (imageFile != null) {
                  File image = File(imageFile.path);

                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context, 
                    CupertinoPageRoute(builder: (_) => RecognizeScreen(image: image))
                  );
                }


              },
            ),
          ],
        ),
      ),
    );
  }
}