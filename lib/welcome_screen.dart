import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mtiwa_familia/core/l10n/utils/localizations.dart';
import 'package:mtiwa_familia/core/router/routes/routes.dart';
import 'package:mtiwa_familia/features/authentification/presentation/components/animated_button.dart';
import 'package:rive/rive.dart' hide Image;

import 'features/authentification/presentation/components/custom_auth_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  void _onSignInPressed() {
    _btnAnimationController.isActive = true;
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        isSignInDialogShown = true;
      });
      customAuthDialog(context, onClosed: (_) {
        setState(() {
          isSignInDialogShown = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            top: isSignInDialogShown ? -51 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const WelcomeText(),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: _onSignInPressed,
                    ),
                    const SignInFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset('assets/Backgrounds/Spline.png'),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          ),
        ),
        const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        children: [
          Text(
            context.l10n.exploreYourFamily,
            style: const TextStyle(
              fontSize: 60,
              fontFamily: "Poppins",
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(context.l10n.joinUsToGrowYourFamilyTree),
        ],
      ),
    );
  }
}

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(
        context.l10n.togetherForABetterFuture,
        style: const TextStyle(),
      ),
    );
  }
}
