enum PetType { cat, dog }

class Pet {
  final String name;
  final PetType type;
  final int starLevel; // 1-5 stars
  final String imagePath;

  Pet({
    required this.name,
    required this.type,
    required this.starLevel,
    required this.imagePath,
  });

  // Helper method to get pet type as string
  String get typeString {
    switch (type) {
      case PetType.cat:
        return 'Cat';
      case PetType.dog:
        return 'Dog';
    }
  }

  // Helper method to get star display
  String get stars {
    return '⭐' * starLevel;
  }
}

// Sample pets list
class PetsList {
  static List<Pet> getAllPets() {
    return [
      Pet(
        name: 'Skye',
        type: PetType.cat,
        starLevel: 3,
        imagePath: 'assets/images/pink_cat.png',
      ),
      Pet(
        name: 'Toby',
        type: PetType.dog,
        starLevel: 3,
        imagePath: 'assets/images/brown_dog.png',
      ),
    ];
  }

  // Get pets by type
  static List<Pet> getCats() {
    return getAllPets().where((pet) => pet.type == PetType.cat).toList();
  }

  static List<Pet> getDogs() {
    return getAllPets().where((pet) => pet.type == PetType.dog).toList();
  }

  // Get pets by star level
  static List<Pet> getPetsByStarLevel(int starLevel) {
    return getAllPets().where((pet) => pet.starLevel == starLevel).toList();
  }

  // Get highest rated pets (4-5 stars)
  static List<Pet> getHighRatedPets() {
    return getAllPets().where((pet) => pet.starLevel >= 4).toList();
  }
}
