import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mtiwa_familia/core/helpers/build_divider.dart';
import 'package:mtiwa_familia/core/theming/styles.dart';

class SignInWithGoogleText extends StatelessWidget {
  const SignInWithGoogleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        BuildDivider.buildDivider(),
        Gap(5.w),
        Text(
          'or Sign in with',
          style: TextStyles.font13Grey400Weight,
        ),
        Gap(5.w),
        BuildDivider.buildDivider(),
      ],
    );
  }
}
