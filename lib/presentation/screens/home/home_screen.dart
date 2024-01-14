import 'package:education/presentation/screens/home/widgets/baqat.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/home_app_bar.dart';
import 'package:education/presentation/screens/home/widgets/subjects.dart';
import 'package:education/presentation/screens/home/widgets/suggestions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeAppBar(),
        const Baqat(),
        Subjects(),
        Suggestions(),
      ],
    );
  }
}
