import 'package:flutter/cupertino.dart';

import 'grid_view_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(this._stringsList, this._iconsList, this._actions, {super.key});

  final List<String> _stringsList;
  final List<IconData> _iconsList;
  final List<Function> _actions;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(_stringsList.length, (index) {
        return GridViewItem(itemName: _stringsList[index], itemIcon: _iconsList[index], action: _actions[index],);
      }),
    );
  }
}
