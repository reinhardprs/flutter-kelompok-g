import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/settings/provid.dart';
import 'package:money_manage/settings/syarat_ketentuan.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:money_manage/data/data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'about.dart';
import 'kebijakan_privasi.dart';
import 'myaccount.dart';

class SettingApp extends StatelessWidget {
  const SettingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final username = userProvider.currentUser?.username ?? 'Guest';
    final phone = userProvider.currentUser?.phone ?? 'No number';
    var notif = Provider.of<NotifProvider>(context).isNotif;
    var fontSizeProvider = Provider.of<FontSizeProvider>(context);
    var fontSize = fontSizeProvider.fontSize;
    var langProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.setting,
            style: GoogleFonts.abel(
              fontSize: fontSize,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w800,
              color: kTextColor,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccount()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                          backgroundColor: kTextColor,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: GoogleFonts.aBeeZee(
                                fontSize: fontSize,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w500,
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              phone,
                              style: GoogleFonts.aBeeZee(
                                fontSize: fontSize,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w500,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/Logo_SpendWise.png'),
            height: 155.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                color: kPrimaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomFeatureWidget(
                      title: AppLocalizations.of(context)!.myAccount,
                      fontSize: fontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyAccount()),
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    CustomFeatureWidget(
                      title: AppLocalizations.of(context)!.about,
                      fontSize: fontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutApl()),
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    CustomFeatureWidget(
                      title: AppLocalizations.of(context)!.termsAndConditions,
                      fontSize: fontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsandConditionPage()),
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    CustomFeatureWidget(
                      title: AppLocalizations.of(context)!.privacyPolicy,
                      fontSize: fontSize,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Divider(
                          color: kTextColor,
                          thickness: 1,
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.language,
                          style: GoogleFonts.abel(
                              fontSize: fontSize,
                              color:
                              kTextColor),
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: Provider.of<LanguageProvider>(context)
                                  .groupButton,
                              onChanged: (val) {
                                langProvider.changeLocale(Locale('en'));
                              },
                              activeColor: kSecondaryColor,
                            ),
                            Text(
                              AppLocalizations.of(context)!.english,
                              style: GoogleFonts.abel(
                                  fontSize: fontSize,
                                  color:
                                  kTextColor),
                            ),
                            SizedBox(width: 10),
                            Radio(
                              value: 1,
                              groupValue: Provider.of<LanguageProvider>(context)
                                  .groupButton,
                              onChanged: (val) {
                                langProvider.changeLocale(Locale('id'));
                              },
                              activeColor: kSecondaryColor,
                            ),
                            Text(
                              AppLocalizations.of(context)!.indonesian,
                              style: GoogleFonts.abel(
                                  fontSize: fontSize,
                                  color:
                                  kTextColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: kTextColor,
                          thickness: 1,
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.notification,
                          style: GoogleFonts.abel(
                              fontSize: fontSize, color: kTextColor),
                        ),
                        SwitchListTile(
                          value: notif,
                          onChanged: (bool val) {
                            Provider.of<NotifProvider>(context, listen: false)
                                .changeMode();
                          },
                          activeTrackColor: kSecondaryColor,
                          title: Text(
                            notif ? AppLocalizations.of(context)!.on : AppLocalizations.of(context)!.off,
                            style: GoogleFonts.abel(
                                fontSize: fontSize, color: kTextColor),
                          ),
                        ),
                        Divider(
                          color: kTextColor,
                          thickness: 1,
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.fontSize,
                          style: GoogleFonts.abel(
                              fontSize: fontSize, color: kTextColor),
                        ),
                        Slider(
                          value: fontSizeProvider.sliderValue,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: fontSizeProvider.sliderValue.toInt().toString(),
                          onChanged: (double newValue) {
                            fontSizeProvider.setSliderValue(newValue);
                          },
                        ),
                        Divider(
                          color: kTextColor,
                          thickness: 1,
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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

class CustomFeatureWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double fontSize;

  const CustomFeatureWidget({
    required this.title,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.abel(fontSize: fontSize, color: kTextColor),
              ),
              Icon(
                Icons.arrow_right,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
