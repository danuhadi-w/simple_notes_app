import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/controllers/notes_controller.dart';
import 'package:simple_notes_app/models/note_model.dart';
import 'package:simple_notes_app/views/createdit_note_view.dart';

class Tile extends StatelessWidget {
  const Tile({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Center(
          child: Text(
        "$index",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}

var dummyGrid = SingleChildScrollView(
  child: StaggeredGrid.extent(
    axisDirection: AxisDirection.down,
    maxCrossAxisExtent: 300,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent: 200,
        child: Tile(index: 0),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent: 100,
        child: Tile(index: 1),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent: 200,
        child: Tile(index: 2),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 1,
        mainAxisExtent: 100,
        child: Tile(index: 3),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: 100,
        child: Tile(index: 4),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: 100,
        child: Tile(index: 5),
      ),
    ],
  ),
);

class NotesGrid extends StatelessWidget {
  const NotesGrid(this.notes, {super.key});

  final List<Note> notes;

  // Widget gridViewOriginal(BuildContext context) => GridView.builder(
  //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //           maxCrossAxisExtent: 300,
  //           childAspectRatio: 4 / 3,
  //           crossAxisSpacing: 5,
  //           mainAxisSpacing: 5),
  //       itemBuilder: ((context, index) {
  //         return GridItem(
  //           notes: notes,
  //           index: index,
  //         );
  //       }),
  //       itemCount: notes.length,
  //     );

  Widget staggeredGridView(BuildContext context) {
    return GetBuilder<NotesController>(
      initState: (_) {},
      builder: (_) {
        return StaggeredGrid.extent(
          axisDirection: AxisDirection.down,
          maxCrossAxisExtent: 300,
          children: [
            for (var note in notes)
              StaggeredGridTile.extent(
                crossAxisCellCount: 1,
                mainAxisExtent: note.content!.length < 21 ? 100 : 200,
                child: GridItem(
                  note: note,
                ),
              )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return staggeredGridView(context);
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        tappable: false,
        closedColor: Color.fromARGB(255, 250, 250, 250),
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        closedBuilder: (context, openContainer) {
          return Card(
            elevation: 3,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: openContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (note.title!.isNotEmpty)
                      Text(
                        note.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    if (note.content!.isNotEmpty)
                      Expanded(
                        flex: 2,
                        child: Text(
                          note.content!,
                          softWrap: true,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
        openBuilder: (context, _) => CreateditNote(note));
  }
}
