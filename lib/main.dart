import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mtiwa_familia/core/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtiwa_familia/features/authentification/presentation/logic/cubit/auth_cubit.dart';
import 'package:mtiwa_familia/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/theming/colors.dart';

void main() async {
  configureDependencies();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    preloadSVGs(['assets/svgs/google_logo.svg'])
  ]);
  runApp(
    const MyApp(),
  );
}

Future<void> preloadSVGs(List<String> paths) async {
  for (final path in paths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('fr'),
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
        ],
        title: 'Mti Familia',
        theme: ThemeData(
          useMaterial3: true,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsManager.mainBlue,
            selectionColor: Color.fromARGB(188, 36, 124, 255),
            selectionHandleColor: ColorsManager.mainBlue,
          ),
        ),
      ),
    );
  }
}
