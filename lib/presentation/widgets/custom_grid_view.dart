import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/models/home_ui.dart';
import 'grid_view_item.dart';

class CustomGridView extends StatelessWidget {

  final List<HomeUI> _items;
  const CustomGridView(this._items, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p28),
      crossAxisCount:(MediaQuery.of(context).size.width ~/ 150).toInt(),
      crossAxisSpacing: 15,
      mainAxisSpacing: 30,
      children: List.generate(_items.length, (index) {
        return GridViewItem(item: _items[index],);
      }),
    );
  }
}
