import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_notes_app/models/note_model.dart';
import 'package:flutter/material.dart';

final formatter = DateFormat.yMMMd();

class NotesController extends GetxController {
  /*-----------------------------------------------------------------------*/
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey {
    return _formKey;
  }

  /*-----------------------------------------------------------------------*/

  final _myNotes = <Note>[
    Note(
      title: "Note title 1",
      content: "This is a test note \nTest\nTest\nTest\nTest\nTest\nTest",
      dateCreated: formatter.format(
        DateTime.now().subtract(
          Duration(days: 365),
        ),
      ),
      dateUpdated: formatter.format(
        DateTime.now().subtract(
          Duration(days: 365),
        ),
      ),
    ),
    Note(
        title: "Note title 2",
        content: "This is a test2 note",
        dateCreated: formatter.format(DateTime.now()),
        dateUpdated: formatter.format(DateTime.now())),
    Note(
      title: "Note title 3",
      content: "This is a test3 note \nTest\nTest\nTest",
      dateCreated: formatter.format(
        DateTime.now().subtract(
          Duration(days: 365),
        ),
      ),
      dateUpdated: formatter.format(
        DateTime.now().subtract(
          Duration(days: 365),
        ),
      ),
    ),
    Note(
        title: "Note title 4",
        content: "This is a test4 note",
        dateCreated: formatter.format(DateTime.now()),
        dateUpdated: formatter.format(DateTime.now())),
  ].obs;

  RxList<Note> get myNotes {
    return _myNotes;
  }

  void addNote(
      String title, String content, String dateCreated, String dateUpdated) {
    /*-----------------------------------------------------------------------*/
    _myNotes.add(
      Note(
          title: title,
          content: content,
          dateCreated: dateCreated,
          dateUpdated: dateUpdated),
    );

    update();
  }

  void editNote(
      String id, String title, String content, String dateUpdated) async {
    var note = findById(id);
    if (note != null && (title.isNotEmpty || content.isNotEmpty)) {
      note.title = title;
      note.content = content;
      note.dateUpdated = dateUpdated;
    } else {
      print("masok");
      removeNote(id);
    }
    return Future.delayed(Duration(milliseconds: 300), () => update());
  }

  Note? findById(String id) {
    return _myNotes.firstWhereOrNull((note) => note.id == id);
  }

  void removeNote(String id) {
    var tempNote = findById(id);
    if (tempNote != null) {
      _myNotes.remove(tempNote);
    }
  }
}
