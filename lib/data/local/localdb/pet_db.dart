import 'package:cat_api/data/local/model/pet.dart';
import 'package:cat_api/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyPetDB {
  static Box<Pet> petBox = Hive.box<Pet>('pets');

  static Future<void> init() async {
    await Hive.openBox<Pet>('pets');
  }

  static List<Pet> getAllPets() {
    return petBox.values.toList();
  }

  static Pet? getSpecificPet(Pet pet) {
    return petBox.get(pet.petName);
  }

  static Future<void> addPet(Pet pet) async {
    await petBox.add(pet);

    Get.snackbar(
      'CatAPI',
      'Pet ${pet.petName}, is saved successfully!',
      colorText: Colors.white,
      backgroundColor: colorSecondaryBlack,
    );
  }

  static Future<void> updatePet(Pet pet) async {
    await petBox.put(pet.petName, pet);

    Get.snackbar(
      'CatAPI',
      'Pet ${pet.petName}, is edit successfully!',
      colorText: Colors.white,
      backgroundColor: colorSecondaryBlack,
    );
  }
}
