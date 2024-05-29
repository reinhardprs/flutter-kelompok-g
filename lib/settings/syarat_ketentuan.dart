import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';

class TermsandConditionPage extends StatelessWidget {
  const TermsandConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
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
                  Text('Syarat dan Ketentuan',style: GoogleFonts.aBeeZee(
                      fontSize: 35.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                  Text(
                    'Syarat dan Ketentuan (“Syarat dan Ketentuan”) ini dan segala peraturan atau kebijakan lain yang tersedia pada aplikasi SpendWise merupakan perjanjian-perjanjian yang mengikat berdasarkan Hukum yang Berlaku antara Pengguna dan PT Kelompok G.\nKami mewajibkan Anda untuk membaca seluruh isi Perjanjian dan apabila Anda memiliki pertanyaan apapun mengenai Perjanjian, Anda dapat menghubungi Kami melalui admin@SpendWise.id.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('1. Syarat Penggunaan', style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text('Anda menyetujui hal-hal berikut sehubungan dengan penggunaan Layanan:\n  1. SpendWise dapat mengumpulkan Informasi Pribadi Anda, seperti nama, alamat email selama proses pendaftaran Aplikasi atau ketika Aplikasi menjalankan fungsinya baik untuk penggunaan Layanan atau fungsi lainnya yang diperlukan untuk mendukung ekosistem Layanan. Anda diharapkan untuk memperbarui Informasi Pribadi Anda jika terdapat perubahan Informasi Pribadi seperti alamat email.\n  2. SpendWise dapat menggunakan email Anda untuk mendaftar kepada newsletter, survei, atau aktivitas lain SpendWise yang terkait dengan Layanan. SpendWise hanya mengumpulkan Informasi Pribadi jika Anda telah setuju untuk berpartisipasi dalam aktivitas terkait. Anda dapat menolak untuk berpartisipasi dalam program SpendWise.\n  3.Anda setuju untuk mematuhi Hukum Yang Berlaku sehubungan dengan penggunaan Aplikasi.\n 4. Anda hanya dapat mendaftarkan satu akun di Aplikasi dan bertanggung jawab penuh atas segala aktivitas yang terjadi melalui akses Aplikasi Anda termasuk tanggung jawab atas semua tindakan penggunaan Layanan oleh siapa pun atas nama Anda. Untuk menjaga kendali atas akun dan mencegah siapapun dapat mengakses akun (yang akan mencakup informasi tentang melihat riwayat akun), Anda bertanggung jawab atas kendali dan akses Layanan dan tidak mengungkapkan OTP, Pin Otorisasi, atau informasi metode pembayaran kepada siapapun.\n 5. Informasi yang diberikan melalui Aplikasi atau media sosial SpendWise tidak boleh disalahgunakan untuk tujuan investasi ilegal atau tujuan penipuan yang dapat merugikan orang lain.\n  6. Anda tidak diperbolehkan untuk mencoba mengganggu fungsi pengoperasian Aplikasi atau situs web SpendWise. Hal ini termasuk mengirimkan permintaan pencarian melalui robot, crawlers untuk mendapatkan konten atau Informasi Pribadi pada Layanan dan menyebarkan virus yang dapat mengganggu pengoperasian Aplikasi SpendWise.', style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                    Text('2. Kewajiban Pengguna', style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text('  1. Pengguna harus memastikan hanya memakai Layanan pada Aplikasi untuk keperluan Pengguna yang benar dan secara sah, sesuai dengan Hukum Yang Berlaku, Syarat dan Ketentuan dan pemberitahuan yang diumumkan oleh SpendWise atau ketentuan yang tercantum di Aplikasi. Pengguna boleh memakai Layanan dan Aplikasi atas nama orang atau badan lain, atau untuk memberikan Layanan kepada mereka, tetapi Pengguna harus memastikan bahwa Pengguna mempunyai wewenang untuk melakukannya, dan semua pihak yang menerima Layanan melalui Pengguna memenuhi dan menyetujui semua syarat dalam Syarat dan Ketentuan ini yang berlaku kepada Pengguna.\n 2. Pengguna berkewajiban untuk menjaga kerahasiaan akun termasuk OTP dan Pin Otorisasi, serta bertanggung jawab sepenuhnya atas segala kegiatan yang diatasnamakan nama akun Pengguna. SpendWise tidak bertanggung jawab atas penyalahgunaan akun, manipulasi data, penghapusan data, maupun pemblokiran akun akibat kelalaian Pengguna dalam menjaga dan mengelola akun, serta kebocoran akun Pengguna akibat kelalaian Pengguna dalam menyimpan, mengingat, atau memberikan informasi atas akun kepada pihak lain. Pengguna setuju untuk segera memberitahukan kepada SpendWise setiap adanya dugaan penggunaan yang tidak sah atau tidak valid dengan pengatasnamaan nama akun Pengguna.', style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    Text('2. Kewajiban SpendWise', style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text('SpendWise berkewajiban untuk berusaha semaksimal mungkin untuk mengelola dan merawat Aplikasi serta Layanan agar dapat digunakan dengan baik dan lancar. SpendWise dengan ini berkewajiban untuk dapat memberikan bantuan teknis dan/atau operasional kepada Pengguna dalam hal terjadi gangguan yang masih termasuk dalam batas kewajaran sesuai dengan standar layanan SpendWise, termasuk memberikan edukasi terkait penggunaan Aplikasi dan Layanan.', style: GoogleFonts.aBeeZee(
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