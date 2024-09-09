import 'package:flutter/material.dart';

import 'constants.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: ksecondryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.support_agent,
            size: 50,
            color: ksecondryColor,
          ),
          SizedBox(width: 10),
          Text(
            "Feel Free to Ask, We Ready to Help",
            style: TextStyle(
              fontSize: ksmallFontSize,
              color: ksecondryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
