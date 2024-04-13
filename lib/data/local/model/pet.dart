import 'package:hive/hive.dart';

part 'pet.g.dart';

@HiveType(typeId: 0)
class Pet {
  @HiveField(0)
  final String petName;
  @HiveField(1)
  final String breed;
  @HiveField(2)
  final double weight;
  @HiveField(3)
  final double age;
  @HiveField(4)
  final String imageUrl;

  Pet({
    required this.petName,
    required this.breed,
    required this.weight,
    required this.age,
    required this.imageUrl,
  });
}
