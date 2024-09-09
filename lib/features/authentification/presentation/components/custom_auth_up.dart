import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mtiwa_familia/core/l10n/utils/localizations.dart';
import 'package:mtiwa_familia/features/authentification/presentation/components/sign_in_form.dart';

import 'sing_up_form.dart';

Future<Object?> customAuthDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: context.l10n.login,
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      Tween<Offset> tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (c, _, __) => const Center(
      child: FlappableDialog(),
    ),
  ).then(onClosed);
}

class FlappableDialog extends StatefulWidget {
  const FlappableDialog({super.key});

  @override
  State<FlappableDialog> createState() => _FlappableDialogState();
}

class _FlappableDialogState extends State<FlappableDialog>
    with SingleTickerProviderStateMixin {
  bool isShowingSignIn = true;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    super.initState();
  }

  void _flipCard() {
    if (isShowingSignIn) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      isShowingSignIn = !isShowingSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final isFlipped = _controller.value >= 0.5;
        return Transform(
          transform: Matrix4.rotationY(_controller.value * pi),
          alignment: Alignment.center,
          child: Transform(
            alignment: Alignment.center,
            transform: isFlipped ? Matrix4.rotationY(pi) : Matrix4.rotationY(0),
            child: Container(
              height: 630,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: isShowingSignIn
                    ? _buildSignIn(context)
                    : _buildSignUp(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                context.l10n.login,
                style: const TextStyle(fontSize: 30, fontFamily: "Poppins"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  context.l10n.accessToOurUtils,
                  textAlign: TextAlign.center,
                ),
              ),
              const SignInForm(),
              const DividerWithText(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  context.l10n.signUpWith,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: _flipCard,
                    icon: SvgPicture.asset(
                      "assets/icons/email_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/apple_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/google_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: -48,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                context.l10n.signUp,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: "Poppins",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  context.l10n.createAccount,
                  textAlign: TextAlign.center,
                ),
              ),
              const SignUpForm(),
              const DividerWithText(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  context.l10n.signUpWith,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: _flipCard,
                    icon: SvgPicture.asset(
                      "assets/icons/email_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/apple_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/google_box.svg",
                      height: 64,
                      width: 64,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: -48,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "OR",
            style: TextStyle(color: Colors.black26),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
