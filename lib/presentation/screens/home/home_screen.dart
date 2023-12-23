import 'package:flutter/material.dart';

import '../../../domain/models/home_ui.dart';
import '../../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(HomeUI.getItems(context));
  }
}
