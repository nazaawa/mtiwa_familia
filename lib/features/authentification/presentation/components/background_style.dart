import 'package:flutter/material.dart';
import 'package:mtiwa_familia/gen/assets.gen.dart';

class BackgroundStyle extends StatelessWidget {
  const BackgroundStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Assets.svgs.ellipseRight.svg(),
          ),
        ],
      ),
    );
  }
}
