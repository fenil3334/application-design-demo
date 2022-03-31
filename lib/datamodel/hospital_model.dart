class HospitalModel {
  final int id;
  final String name;
  final int age;
  bool isselect;
  final String gender;
  String time;

  HospitalModel({
    required this.id,
    required this.name,
    required this.age,
    required this.isselect,
    required this.gender,
    required this.time,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'],
      name: json['Name'],
      age: json['Age'],
      isselect: json['Isselect'],
      gender: json['Gender'],
      time: json['Time'],
    );
  }
}
