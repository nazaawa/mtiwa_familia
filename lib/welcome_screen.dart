import 'package:flutter/material.dart';
import 'package:mtiwa_familia/core/l10n/utils/localizations.dart';
import 'package:mtiwa_familia/core/router/routes/routes.dart';
import 'package:mtiwa_familia/core/widgets/custom_button_app.dart';
import 'package:mtiwa_familia/gen/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Assets.svgs.fatherAndDaughter.svg(
              height: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Text(
                context.l10n.discoverRoots,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF1F41BB),
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Text(
                context.l10n.joinUsToGrowYourFamilyTree,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButtonApp(
              label: context.l10n.start,
              onTap: () => const LoginRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}
