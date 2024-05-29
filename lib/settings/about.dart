import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';

class AboutApl extends StatelessWidget {
  const AboutApl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About This App',
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
                  Text('Kami percaya bahwa hal besar dimulai dari satu langkah pintar!',style: GoogleFonts.aBeeZee(
                      fontSize: 35.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                  Text(
                    'Berdiri sejak tahun 2020, SpendWise didirikan atas nama PT Kelompok G.\n\nDigerakkan oleh visi meningkatkan literasi masyarakat Indonesia, SpendWise berkomitmen untuk menyediakan jasa aplikasi pengatur keuangan dengan aman dan terpercaya. Layanan SpendWise dapat diakses secara online, oleh berbagai lapisan masyarakat.\n\nMisi kami adalah untuk mengedukasi masyarakat Indonesia tentang pentingnya pengelola keuangan yang cerdas. Oleh karena itu, kami sering mengadakan acara edukatif dengan komonitas Sobat SpendWise dan institusi pendidikan.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
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
                                    'Layanan Pengaduan Konsumen',
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