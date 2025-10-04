import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.white, size: 30),
              onPressed: () {
                // Handle favorite button press
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity, // This ensures the Column takes full width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Add space above the text
            Text(
              'Spend time with your pet!',
              style: TextStyle(
                fontFamily: "Bitcount",
                fontSize: 19,
                fontVariations: [FontVariation('wght', 500)],
                color: Colors.white,
                letterSpacing:
                    0, // Negative values bring letters closer together
              ),
            ),
            Container(height: 70), // Adjust this value to move circle up/down
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.lightBlue[100]!, width: 17.0),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/brown_cat.png',
                    width: 180,
                    height: 180,
                    filterQuality: FilterQuality.none,
                    fit: BoxFit
                        .cover, // This ensures the image fills the circle properly
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
