
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.privacyPolicy,
          style: GoogleFonts.abel(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.privacyPolicy,style: GoogleFonts.aBeeZee(
                      fontSize: 35.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                  Text(
                    AppLocalizations.of(context)!.privacyPolicyText1,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(AppLocalizations.of(context)!.privacyPolicyText2, style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text(AppLocalizations.of(context)!.privacyPolicyText3, style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                    Text(AppLocalizations.of(context)!.privacyPolicyText4, style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text(AppLocalizations.of(context)!.privacyPolicyText5, style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    Text(AppLocalizations.of(context)!.privacyPolicyText6, style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                  Container(
                    decoration: BoxDecoration(color: kSecondaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SpendWise',
                                style: GoogleFonts.abel(
                                  fontSize: 25.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor,
                                ),
                              ),
                              Text(
                                'PT Kelompok G',
                                style: GoogleFonts.abel(
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                              ),
                              Text(
                                'IF-B Pagi, Teknik Informatika, Mikroskil.\n\nJl. M.H Thamrin No.140, Pusat Ps., Kec. Medan Kota, Kota Medan, Sumatera Utara.',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Icon(Icons.facebook, size: 30, color: kTextColor),
                                  SizedBox(width: 10.0),
                                  Icon(Icons.youtube_searched_for, size: 30, color: kTextColor),
                                  SizedBox(width: 10.0,),
                                  Icon(Icons.telegram, size: 30, color: kTextColor),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.footer,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 18.0,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w500,
                                      color: kTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android_outlined, size: 30, color: kTextColor),
                                      SizedBox(width: 10.0),
                                      Text('081234567890', style: TextStyle(fontSize: 16.0, color: kTextColor)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Icon(Icons.email_outlined, size: 30, color: kTextColor),
                                      SizedBox(width: 10.0),
                                      Text('admin@SpendWise.id', style: TextStyle(fontSize: 16.0, color: kTextColor)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}