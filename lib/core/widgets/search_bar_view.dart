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
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
                offset: const Offset(5, 5),
                blurRadius: 2,
                color: KPrimaryColor.withOpacity(0.23)),
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: KTextColorBlack),
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
