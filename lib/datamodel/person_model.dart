import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class PersonModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;

  PersonModel({
    required this.name,
    required this.country,
  });
}