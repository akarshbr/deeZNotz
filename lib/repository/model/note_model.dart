import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late DateTime dateTime;

  NoteModel({
    required this.title,
    required this.description,
    required this.dateTime,
  });

  NoteModel.copy(NoteModel other) {
    title = other.title;
    description = other.description;
    dateTime = other.dateTime;
  }
}
