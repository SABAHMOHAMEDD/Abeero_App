import 'package:flutter/material.dart';

import '../../core/widgets/summary_listview.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          const SummaryListview(),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
