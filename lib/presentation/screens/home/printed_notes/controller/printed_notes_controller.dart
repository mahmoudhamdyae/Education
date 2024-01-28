import 'package:education/domain/models/notes/note.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:get/get.dart';

class PrintedNotesController extends GetxController {

  final RxList<Note> notes = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;
  late final String saff;

  PrintedNotesController(this._repository) {
    Map<String, dynamic>? argument = Get.arguments;
    saff = argument?['saff'] ?? _repository.getGrade();
  }

  getNotes() async {
    _status.value = RxStatus.loading();
    try {
      _repository.getNotes(saff).then((remoteNotes) {
        _status.value = RxStatus.success();
        notes.value = remoteNotes;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }

  getAllNotes() async {
    _status.value = RxStatus.loading();
    try {
      _repository.getAllNotes().then((remoteNotes) {
        _status.value = RxStatus.success();
        notes.value = remoteNotes;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }

  addNoteToCart(String noteId) {
    try {
      _repository.addNoteToCart(noteId).then((remoteNotes) {
        _status.value = RxStatus.success();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }

  removeNoteFromCart(String noteId) {
    try {
      _repository.removeNoteFromCart(noteId).then((remoteNotes) {
        _status.value = RxStatus.success();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }

  bool isNoteInCart(String noteId) {
    return _repository.isNoteInCart(noteId);
  }
}