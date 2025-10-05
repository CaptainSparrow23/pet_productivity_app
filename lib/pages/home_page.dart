import 'package:flutter/material.dart';
import 'package:pet_productivity_app/pages/settings_page.dart';
import 'package:pet_productivity_app/pages/pets_page.dart';
import '../utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List _pages = [
    const HomePage(),
    const SettingsPage(),
    const PetsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        iconTheme: IconThemeData(color: Colors.white), // Make drawer icon white
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
      drawer: SizedBox(
        width: 200, // Adjust this value to change drawer width (default is around 304)
        child: Drawer(
          backgroundColor: AppColors.deepBlue,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: AppColors.lightGray),
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
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
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
            petWindow(),
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
        border: Border.all(color: AppColors.lightGray, width: 17.0),
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
    );
  }
}
