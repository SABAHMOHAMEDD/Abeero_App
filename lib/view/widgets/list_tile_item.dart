import 'package:flutter/material.dart';

import '../../core/IconBroken.dart';
import '../../core/constants.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    required this.title,
    required this.leadingIcon,
  });
  final String title;
  final IconData leadingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        leading: Icon(
          leadingIcon,
          size: 28,
          color: KPrimaryColor,
        ),
        trailing: const Icon(
          IconBroken.Arrow___Right_2,
          size: 26,
          color: Colors.grey,
        ),
      ),
    );
  }
}
