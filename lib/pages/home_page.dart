import 'package:flutter/material.dart';
import 'package:pet_productivity_app/pages/settings_page.dart';
import 'package:pet_productivity_app/pages/pets_page.dart';
import '../utils/app_colors.dart';
import '../models/timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmBeige,
      appBar: AppBar(
        backgroundColor: AppColors.warmBeige,
        iconTheme: IconThemeData(color: Colors.white), // Make drawer icon white
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.white, size: 25),
              onPressed: () {
                // Handle favorite button press
              },
            ),
          ),
        ],
      ),
      drawer: SizedBox(
        width:
            220, // Adjust this value to change drawer width (default is around 304)
        child: Drawer(
          backgroundColor: AppColors.warmBeige,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: null,
              ),

              ListTile(
                leading: Icon(Icons.pets, color: Colors.white),
                title: Text(
                  'My Pets',
                  style: TextStyle(
                    fontFamily: "Bitcount",
                    fontSize: 18,
                    fontVariations: [FontVariation('wght', 500)],
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer first
                  Navigator.pushNamed(context, '/pets');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: "Bitcount",
                    fontSize: 18,
                    fontVariations: [FontVariation('wght', 500)],
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer first
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Add space a bove the text
            Text(
              'Spend time with your pet !',
              style: TextStyle(
                fontFamily: "Bitcount",
                fontSize: 22,
                fontVariations: [FontVariation('wght', 500)],
                color: Colors.white,
                letterSpacing:
                    0, // Negative values bring letters closer together
              ),
            ),
            Container(height: 70), // Adjust this value to move circle up/down
            petWindow(),
            const SizedBox(height: 50), // Add space below the pet window
            TimerScreen(),
          ],
        ),
      ),
    );
  }

  Container petWindow() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightBeige, width: 17.0),
        borderRadius: BorderRadius.circular(200),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/pink_cat.png',
          width: 230,
          height: 230,
          filterQuality: FilterQuality.none,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
