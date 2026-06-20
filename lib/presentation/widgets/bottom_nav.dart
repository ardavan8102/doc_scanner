import 'package:document_scanner/presentation/widgets/bottom_nav_icon_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

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
              function: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}