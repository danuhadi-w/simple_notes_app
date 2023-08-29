import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/controllers/notes_controller.dart';
import 'package:simple_notes_app/konstant.dart';
import 'package:simple_notes_app/views/createdit_note_view.dart';
import 'package:simple_notes_app/widgets/main_drawer.dart';
import 'package:simple_notes_app/widgets/notes_grid.dart';

class MainView extends GetView<NotesController> {
  const MainView({super.key});

  // Widget animatedFab(BuildContext context, bool isSpinning) => Obx(
  //       () => FloatingActionButton(
  //         onPressed: () {
  //           if (!isSpinning) {
  //             isSpinning = true;
  //             controller.incrementTurns().then((_) {
  //               showCreateditModal(context);
  //               isSpinning = false;
  //             });
  //           }
  //         },
  //         child: AnimatedRotation(
  //           turns: controller.turns.value,
  //           duration: Duration(milliseconds: 300),
  //           child: Icon(
  //             Icons.add,
  //           ),
  //         ),
  //       ),
  //     );
  void iterateNotes() {
    for (var note in controller.myNotes) {
      print(note.dateCreated);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MainDrawer(),
      appBar: AppBar(
        actions: [
          // SizedBox(
          //   width: 50,
          //   child: TextField(
          //     decoration: InputDecoration(
          //         label: Text(
          //       "Show",
          //       style: TextStyle(color: Colors.white),
          //     )),
          //   ),
          // ),
          IconButton(
            onPressed: () {
              iterateNotes();
            },
            icon: const Icon(Icons.cloud_upload),
          ),
        ],
        title: const Text("My Notes"),
      ),
      body: Container(
        margin: Konstant.insets5,
        child: NotesGrid(controller.myNotes),
      ),
      floatingActionButton: OpenContainer(
        closedBuilder: (context, action) {
          return Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          return CreateditNote.addNote();
        },
      ),
    );
  }
}
