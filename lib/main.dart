import 'package:flutter/material.dart';
import 'package:money_manage/add%20typeNames.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/login/login.dart';
import 'package:money_manage/settings/provid.dart';
import 'package:money_manage/home.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:localization_i18n_arb/l10n/l10n.dart';
import 'package:money_manage/l10n/l10n.dart';

// ignore: depend_on_referenced_packages
// import 'package:localization_i18n/arb/l10n/l10n.dart';

import 'data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotifProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => FontSizeProvider()),
        ChangeNotifierProvider(create: (context) => VerificationCodeProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Consumer<LanguageProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Money Manager',
                theme: ThemeData(
                  scaffoldBackgroundColor: kScaffoldColor,
                  appBarTheme: AppBarTheme(
                    backgroundColor: kPrimaryColor,
                    iconTheme: IconThemeData(
                      size: 26.sp,
                      color: kSecondaryColor,
                    ),
                  ),
                  iconTheme: IconThemeData(
                    size: 26.sp,
                    color: kSecondaryColor,
                  ),
                  useMaterial3: true,
                ),
                locale: provider.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
                // home: HomePage(),
                home: Login(),
              );
            },
          );
        },
      ),
    );
  }
}