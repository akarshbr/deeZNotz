import 'package:deeznotz/repository/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteController extends ChangeNotifier {
  final Box<NoteModel> _noteBox = Hive.box("notes");
  List<NoteModel> notes = [];
  int existingNoteIndex = -1;
  bool gridview = true;
  late SharedPreferences sharedPreferences;

  Future<List<NoteModel>> getNotes() async {
    return _noteBox.values.toList();
  }

  Future<void> loadEvents() async {
    final getNote = await getNotes();
    notes = getNote;
    notifyListeners();
  }

  Future<void> addEvent(NoteModel events) async {
    await _noteBox.add(events);
    notifyListeners();
  }

  Future<void> deleteEvent(int index) async {
    await _noteBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> updateEvent(int index, NoteModel updatedNote) async {
    await _noteBox.putAt(index, updatedNote);
    notifyListeners();
  }

  void filterNotes(String query) async {
    if (query.isEmpty) {
      notes = await getNotes();
    } else {
      final allNotes = await getNotes();
      notes = allNotes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void toggleNoteCardView() {
    gridview = !gridview!;
    setGridView(gridview);
    notifyListeners();
  }

   checkGridView() async {
    sharedPreferences = await SharedPreferences.getInstance();
    gridview = (sharedPreferences.getBool("gridview") ?? true);
  }

  setGridView(value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("gridView", value);
  }
}
