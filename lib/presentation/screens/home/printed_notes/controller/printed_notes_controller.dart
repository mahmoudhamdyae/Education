import 'package:education/domain/models/notes/note.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/city.dart';

class PrintedNotesController extends GetxController {

  final RxList<Note> notes = RxList.empty();
  final RxList<int> count = RxList.empty();
  final RxInt sum = 0.obs;
  final RxInt totalSum = 0.obs;
  final RxInt discount = 0.obs;

  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final RxList<String> areas = [
    'المحافظة...',
  ].obs;
  RxString selectedArea = 'المحافظة...'.obs;
  RxList<City> cities = RxList.empty();
  final RxInt selectedCityId = (-1).obs;

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;
  late final String saff;

  PrintedNotesController(this._repository) {
    Map<String, dynamic>? argument = Get.arguments;
    saff = argument?['saff'] ?? _repository.getGrade();
  }


  @override
  Future<void> onInit() async {
    super.onInit();
    _getCities();
  }

  void _getCities() {
    _repository.getCities().then((remoteCities) {
      cities.value = remoteCities;
      for (var element in remoteCities) {
        areas.add(element.name ?? '');
      }
    });
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
        for (var element in remoteNotes) {
          sum.value += element.bookPrice;
          count.add(1);
        }
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

  removeNoteFromCart(Note note) {
    try {
      _repository.removeNoteFromCart(note.id.toString()).then((remoteNotes) {
        _status.value = RxStatus.success();
        notes.remove(note);
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      notes.value = [];
    }
  }

  bool isNoteInCart(String noteId) {
    return _repository.isNoteInCart(noteId);
  }

  void incrementCount(int index) {
    count[index]++;
  }

  void decrementCount(int index) {
    if (count[index] != 1) {
      count[index]--;
    }
  }

  order() async {
    _status.value = RxStatus.loading();
    try {
      await _repository.order(
        userName.text,
        phone.text,
        selectedCityId.value,
        address.text,
        notes,
      ).then((value) {
        _status.value = RxStatus.success();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  void chooseArea(String newArea) {
    selectedArea.value = newArea;
    City city = cities.firstWhere((element) => element.name == newArea);
    selectedCityId.value = city.id ?? -1;
  }
}