import '../presentation/resources/strings_manager.dart';

String convertMarhala(String marhala) {
  switch(marhala) {
    case AppStrings.primaryMarhala:
      return 'ابتدائى';
    case AppStrings.mediumMarhala:
      return 'متوسط';
    case AppStrings.secondaryMarhala:
      return 'ثانوى';
    default:
      return '';
  }
}