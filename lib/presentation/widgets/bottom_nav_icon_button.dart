import 'package:flutter/material.dart';

class BottomNavBarIconButton extends StatelessWidget {
  const BottomNavBarIconButton({
    super.key, this.function, required this.icon, this.size,
  });

  final Function()? function;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Icon(
        icon,
        size: size ?? 50,
        color: Colors.white,
      ),
    );
  }
}