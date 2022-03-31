import 'package:application_design_demo/datamodel/person_model.dart';
import 'package:hive/hive.dart';

class DataModelAdapter extends TypeAdapter<PersonModel> {
  @override
  final typeId = 0;

  @override
  PersonModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonModel(
      name: fields[0] as String,
      country: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country);
  }
}