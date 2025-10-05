import 'package:flutter/material.dart';
import 'package:pet_productivity_app/models/scenetoggle.dart';
import '../utils/app_colors.dart';
import '../models/pets.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  int selectedView = 0;
  // 0 for bedroom, 1 for park
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmBeige,
      appBar: AppBar(
        backgroundColor: AppColors.warmBeige,
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
      body: Column(
        children: [
          // Toggle buttons container
          Container(
            height: 50,
            width: double.infinity,
            color: AppColors.warmBeige,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: AnimatedStatusWidget(
                  selectedView: selectedView,
                  onBedRoomPressed: () {
                    setState(() {
                      selectedView = 0;
                    });
                  },
                  onParkPressed: () {
                    setState(() {
                      selectedView = 1;
                    });
                  },
                ),
              ),
            ),
          ),
          // Pet room
          selectedScene(),
          // Bottom half - Pet List
          animalList(),
        ],
      ),
    );
  }

  Expanded animalList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 pets per row
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 2.2, // Make tiles shorter and wider
          ),
          itemCount: PetsList.getAllPets().length,
          itemBuilder: (context, index) {
            final pet = PetsList.getAllPets()[index];
            return Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Pet image on left
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.lightBeige,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        pet.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.pets,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Pet info on right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Pet Name
                        Text(
                          pet.name,
                          style: const TextStyle(
                            fontFamily: "Bitcount",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1.0),
                        // Pet Type
                        Text(
                          pet.typeString,
                          style: const TextStyle(
                            fontFamily: "Bitcount",
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        // Star Level
                        Text(pet.stars, style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container selectedScene() {
    // Determine which image to show based on selectedView
    String imagePath;
    if (selectedView == 0) {
      imagePath = 'assets/images/girl_bedroom.png';
    } else {
      imagePath =
          'assets/images/park.png'; // Replace with your actual park image name
    }

    return Container(
      height: 450,
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.lightBeige),
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Keeps aspect ratio
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to bedroom image if the other image doesn't exist
            return Image.asset(
              'assets/images/girl_bedroom.png',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
      ),
    );
  }
}
