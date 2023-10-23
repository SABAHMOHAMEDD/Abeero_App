import 'package:flutter/material.dart';

import '../../core/widgets/summary_listview.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          SummaryListview(),
          Expanded(child: Text('KKKKKKKKKKKKKKKKK'))
        ],
      ),
    );
  }
}
