import 'package:document_scanner/presentation/widgets/text_icon_button.dart';
import 'package:flutter/material.dart';

class TopBoxBar extends StatelessWidget {
  const TopBoxBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[800],
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .center,
          children: [
            TextIconButton(
              icon: Icons.scanner_outlined,
              label: 'Scan',
              function: () {
                
              },
            ),
    
    
            TextIconButton(
              icon: Icons.document_scanner_outlined,
              label: 'Recognize',
              function: () {
                
              },
            ),
    
            TextIconButton(
              icon: Icons.assignment_outlined,
              label: 'Enhance',
              function: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}

