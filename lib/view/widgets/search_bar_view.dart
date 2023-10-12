import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants.dart';


class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 54,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 4,
                color: KPrimaryColor.withOpacity(0.23))
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: TextColorBlack),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/search.svg',
            color: KSecondryColor,
          ),
        ],
      ),
    );
  }
}
