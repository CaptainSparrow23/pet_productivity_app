import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        iconTheme: IconThemeData(color: Colors.white), // Make back arrow white
        title: const Text(
          'My Pets',
          style: TextStyle(
            fontFamily: "Bitcount",
            fontSize: 24,
            fontVariations: [FontVariation('wght', 500)],
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'List of Pets',
          style: TextStyle(
            fontFamily: "Bitcount",
            fontSize: 24,
            fontVariations: [FontVariation('wght', 500)],
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
