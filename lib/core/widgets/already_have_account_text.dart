import 'package:flutter/material.dart';
import 'package:mtiwa_familia/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamedAndRemoveUntil(
        //   Routes.loginScreen,
        //   predicate: (route) => false,
        // );
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyles.font11DarkBlue400Weight,
            ),
            TextSpan(
              text: ' Login',
              style: TextStyles.font11Blue600Weight,
            ),
          ],
        ),
      ),
    );
  }
}
