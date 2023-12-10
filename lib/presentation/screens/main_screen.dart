import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      drawer: const Drawer(
        child: Placeholder(),
      ),
      body: const Placeholder(),
    );
  }
}
