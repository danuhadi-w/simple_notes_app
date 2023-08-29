import 'package:get/get.dart';
import 'package:simple_notes_app/controllers/notes_controller.dart';
import 'package:simple_notes_app/controllers/user_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => NotesController());
  }
}
