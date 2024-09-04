import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mtiwa_familia/core/l10n/utils/localizations.dart';
import 'package:mtiwa_familia/core/router/routes/routes.dart';
import 'package:mtiwa_familia/core/widgets/custom_button_app.dart';
import 'package:mtiwa_familia/core/widgets/custom_text_field.dart';
import 'package:mtiwa_familia/features/authentification/presentation/components/background_style.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundStyle(),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    context.l10n.loginHere,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    context.l10n.welcomeBackYouVeBeenMissed,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const CustomTextField(
                    name: "email",
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    name: "password",
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF1F41BB),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonApp(
                    label: "Login",
                    backgroundColor: const Color(0xFF1F41BB),
                    textColor: Colors.white,
                    onTap: () => const FamilyTreeRoute().go(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Create new account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF494949),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
