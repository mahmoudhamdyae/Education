import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class Baqat extends StatelessWidget {
  const Baqat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: ColorManager.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 0,
                child: Transform.rotate(
                  angle: 26.56,
                  child: Image.asset(
                    ImageAssets.baqatLeft,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Image.asset(
                  ImageAssets.baqat1,
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Transform.rotate(
                  angle: -18.71,
                  child: Image.asset(
                    ImageAssets.baqat2,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 15,
                child: Transform.rotate(
                  angle: -22.35,
                  child: Image.asset(
                    ImageAssets.baqatRight,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                right: 10,
                child: Image.asset(
                    ImageAssets.baqatRightDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.baqat1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.white,
                      ),
                    ),
                    const SizedBox(height: 6.0,),
                    Text(
                      AppStrings.baqat2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white,
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    // Show Button
                    SizedBox(
                      width: 88,
                      child: FilledButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                          ),
                          onPressed: () {
                            // Show
                          },
                          child: Text(
                            AppStrings.show,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.white,
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
