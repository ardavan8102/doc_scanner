import 'package:document_scanner/presentation/widgets/bottom_nav.dart';
import 'package:document_scanner/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: Container(
                  height: MediaQuery.of(context).size.height * .6,
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