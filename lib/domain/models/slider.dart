import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';

class SliderModel {
  String name;
  String image;

  SliderModel(this.name, this.image);

  static List<SliderModel> getData() {
    return [
      SliderModel(AppStrings.silverBaqa, ImageAssets.baqaSilver),
      SliderModel(AppStrings.goldenBaqa, ImageAssets.baqaGolden),
      SliderModel(AppStrings.diamondBaqa, ImageAssets.baqaDiamond),
    ];
  }
}