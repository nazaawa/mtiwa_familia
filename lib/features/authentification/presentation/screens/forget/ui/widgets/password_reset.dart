import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mtiwa_familia/core/helpers/app_regex.dart';
import 'package:mtiwa_familia/core/theming/styles.dart';
import 'package:mtiwa_familia/core/widgets/app_text_button.dart';
import 'package:mtiwa_familia/core/widgets/app_text_form_field.dart';

import '../../../../logic/cubit/auth_cubit.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          emailField(),
          Gap(30.h),
          resetButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  AppTextFormField emailField() {
    return AppTextFormField(
      hint: 'Email',
      validator: (value) {
        String email = (value ?? '').trim();

        emailController.text = email;

        if (email.isEmpty) {
          return 'Please enter an email address';
        }

        if (!AppRegex.isEmailValid(email)) {
          return 'Please enter a valid email address';
        }
      },
      controller: emailController,
    );
  }

  AppTextButton resetButton() {
    return AppTextButton(
      buttonText: 'Reset',
      textStyle: TextStyles.font16White600Weight,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // context.read<AuthCubit>().resetPassword(emailController.text);
        }
      },
    );
  }
}
