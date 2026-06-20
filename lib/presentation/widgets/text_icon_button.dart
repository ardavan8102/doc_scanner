import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key, this.function, required this.icon, required this.label,  this.size = 25,
  });

  final Function()? function;
  final IconData icon;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(
            icon,
            size: size,
            color: Colors.white,
          ),
      
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}