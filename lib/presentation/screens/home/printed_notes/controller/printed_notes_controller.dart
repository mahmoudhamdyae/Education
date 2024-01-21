import 'package:education/domain/models/notes/note.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:get/get.dart';

class PrintedNotesController extends GetxController {

  final RxList<Note> notes = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  PrintedNotesController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getNotes();
  }

  _getNotes() async {
    _status.value = RxStatus.loading();
    try {
      _repository.getNotes(Get.arguments['saff']).then((remoteNotes) {
        _status.value = RxStatus.success();
        notes.value = remoteNotes;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }
}