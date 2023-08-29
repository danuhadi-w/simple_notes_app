import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Note {
  Note({
    this.title,
    this.content,
    this.dateCreated,
    this.dateUpdated,
  }) : id = uuid.v4();

  String id;
  String? title;
  String? content;
  String? dateCreated;
  String? dateUpdated;
}
