import 'package:flutter/cupertino.dart';

import '../../domain/models/HomeUI.dart';
import 'grid_view_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(this._items, {super.key});

  final List<HomeUI> _items;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(_items.length, (index) {
        return GridViewItem(item: _items[index],);
      }),
    );
  }
}
