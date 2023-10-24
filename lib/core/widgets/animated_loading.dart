import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/constants.dart';

class AnimatedLoading extends StatelessWidget {
  const AnimatedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
        child: LoadingAnimationWidget.inkDrop(
      color: KPrimaryColor.withOpacity(.5),
      size: screenSize.width / 12,
    ));
  }
}
