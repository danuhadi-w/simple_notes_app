import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_notes_app/controllers/notes_controller.dart';
import 'package:simple_notes_app/models/note_model.dart';

final formatter = DateFormat.yMMMd();

class CreateditNote extends GetView<NotesController> {
  const CreateditNote(this.note, {super.key});

  CreateditNote.addNote({super.key}) : note = Note();

  final Note note;

  /*-----------------------------------------------------------------------*/
  bool get isEdit {
    return note.dateCreated != null;
  }

  void saveForm() {
    controller.formKey.currentState!.save();
  }

  void saveNote(Map<String, String> inputData) {
    final title = inputData["title"] ?? "";
    final content = inputData["content"] ?? "";
    if (!isEdit) {
      if (title == "" && inputData["content"] == "") {
        return;
      }
      controller.addNote(
        title,
        content,
        formatter.format(DateTime.now()),
        formatter.format(
          DateTime.now(),
        ),
      );
    } else {
      controller.editNote(
        note.id,
        title,
        content,
        formatter.format(
          DateTime.now(),
        ),
      );
    }
  }

  Widget titleTextField(BuildContext context, Map<String, String> inputData) {
    return TextFormField(
      onSaved: (newValue) {
        inputData["title"] = newValue ?? "";
      },
      style: Theme.of(context).textTheme.titleLarge,
      initialValue: isEdit ? note.title : "",
      maxLines: 1,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Title",
      ),
    );
  }

  Widget contentTextField(BuildContext context, Map<String, String> inputData) {
    return TextFormField(
      onSaved: (newValue) {
        inputData["content"] = newValue ?? "";
      },
      style: Theme.of(context).textTheme.titleLarge,
      initialValue: isEdit ? note.content : "",
      maxLines: 10,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Content",
      ),
    );
  }

  /*-----------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    var inputData = {
      "title": "",
      "content": "",
      "dateCreated": "",
      "dateEdited": ""
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(!isEdit ? "Create Note" : "Edit Note"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          saveForm();
          saveNote(inputData);
          return true;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  titleTextField(context, inputData),
                  contentTextField(context, inputData)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
