
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kebijakan Privasi',
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
                  Text('Kebijakan Privasi',style: GoogleFonts.aBeeZee(
                      fontSize: 35.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                  Text(
                    'Kebijakan privasi (“Kebijakan Privasi”) ini adalah kebijakan yang dikeluarkan oleh SpendWise (sebagaimana didefinisikan selanjutnya) yang mengatur tentang cara SpendWise mengumpulkan, mengolah, menggunakan, dan mengungkapkan data dan informasi Pengguna (sebagaimana didefinisikan selanjutnya) dalam Aplikasi (sebagaimana didefinisikan selanjutnya). SpendWise berkomitmen untuk melindungi privasi Pengguna. SpendWise bertanggung jawab untuk menjunjung tinggi prinsip-prinsip pengelolaan data dengan integritas penuh, dimana SpendWise selalu menjadikan keamanan data Pengguna sebagai prioritas utama SpendWise. Untuk itu, keamanan data Pengguna (serta data lain yang Pengguna percayakan kepada SpendWise) adalah hal terpenting bagi SpendWise. Kebijakan Privasi ini menjelaskan bagaimana informasi pribadi Pengguna dikumpulkan, digunakan, dan diungkapkan oleh SpendWise.\n\nKami mewajibkan Anda untuk membaca seluruh isi Perjanjian dan apabila Anda memiliki pertanyaan apapun mengenai Perjanjian, Anda dapat menghubungi Kami melalui admin@SpendWise.id.\n\n Kebijakan Privasi ini berlaku untuk Aplikasi (sebagaimana didefinisikan selanjutnya). Akses kepada Layanan yang tersedia melalui Aplikasi bergantung pada persetujuan Pengguna atas Kebijakan Privasi ini yang sebaiknya dibaca bersama-sama dengan Syarat dan Ketentuan. Persetujuan Pengguna atas Kebijakan Privasi ini, bersama-sama dengan Syarat dan Ketentuan, membentuk perjanjian antara SpendWise dan Pengguna sehubungan dengan penggunaan Aplikasi oleh Pengguna',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('1. Informasi yang dikumpulkan SpendWise atau diberikan oleh Pengguna secara langsung', style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text('  1. SpendWise mengumpulkan Informasi Pribadi tertentu dari Pengguna agar Aplikasi dapat menjalankan fungsinya baik untuk penggunaan Layanan atau fungsi lainnya yang diperlukan untuk mendukung ekosistem Layanan. Informasi Pribadi dapat Pengguna berikan secara langsung (sebagai contoh, data saat Pengguna mendaftar ke dalam Aplikasi seperti nama, alamat email atau nomor telepon, dan keterangan lainnya) maupun terkumpul secara otomatis ketika Pengguna menggunakan Aplikasi, sesuai dengan Syarat dan Ketentuan.\n 2. Ketika Pengguna mengunjungi Aplikasi, administrator Aplikasi akan memproses data teknis (baik yang secara otomatis dikumpulkan atau disediakan oleh Pengguna) seperti alamat protokol internet (internet protocol address) Pengguna, halaman web yang pernah Pengguna kunjungi, browser internet yang Pengguna gunakan, halaman web yang sebelumnya/ selanjutnya Pengguna kunjungi, durasi setiap kunjungan/ sesi, identitas (ID) perangkat internet dan informasi mengenai pabrikan, model, dan sistem operasi dari perangkat yang Pengguna gunakan untuk mengakses Aplikasi yang memungkinkan SpendWise untuk mengirimkan fungsi-fungsi dari Aplikasi, menyelesaikan kesulitan-kesulitan teknis, menyediakan bagi Pengguna versi Aplikasi yang benar dan terkini serta untuk meningkatkan fungsi Aplikasi. Sebagai tambahan, dalam beberapa hal, browser dapat menyarankan Pengguna agar mengaktifkan fungsi Geo-Location Pengguna untuk memungkinkan SpendWise memberikan Pengguna suatu pengalaman yang lebih baik dalam menggunakan internet dan/atau Aplikasi. Dengan data teknis ini administrator-administrator Aplikasi dapat mengelola Aplikasi, misalnya dengan menyelesaikan kesulitan-kesulitan teknis atau memperbaiki kemampuan akses bagian-bagian tertentu dari Aplikasi. Dengan cara ini, SpendWise dapat memastikan bahwa Pengguna dapat terus menemukan informasi pada Aplikasi dengan cara yang cepat dan sederhana.\n 3. SpendWise dapat mengumpulkan informasi dari kesan, pesan, kritik, dan saran yang diberikan Pengguna, pembicaraan melalui chat dan interaksi lainnya di Aplikasi, dan/atau seluruh  data yang Pengguna masukkan ke dalam Aplikasi.\n  4. Pengguna mungkin dapat memberikan kode rujukan (referral code) kepada pihak lain melalui Aplikasi, dalam bentuk suatu pesan yang SpendWise siapkan untuk Pengguna kirimkan atau terbitkan melalui fasilitas pengiriman pesan elektronik atau melalui penyedia media sosial. Pengguna tidak dapat mengubah kalimat pesan yang telah SpendWise siapkan sebelum Pengguna mengirimkannya. SpendWise tidak akan mengumpulkan data pihak yang Pengguna kirimi pesan tersebut.\n  5. SpendWise akan mengumpulkan informasi pada saat Pengguna memasukkan informasi dalam bentuk apapun dalam Aplikasi, pada saat menghubungi tim customer service SpendWise, dan pada saat mengakses Aplikasi, termasuk namun tidak terbatas pada kesan, pesan, kritik, dan saran dari Pengguna, pembicaraan melalui chat, dan interaksi lainnya di Aplikasi. Data yang Pengguna masukkan adalah data Pengguna sendiri yang Pengguna anggap benar, dan Pengguna bertanggung jawab penuh atas segala data yang Pengguna masukkan dalam Aplikasi.', style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    SizedBox(height: 10,),
                    Text('2. Perlindungan dan Kerahasiaan Informasi', style: GoogleFonts.aBeeZee(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),),
                    Text('  1. SpendWise menerapkan berbagai langkah pengamanan untuk menjaga keamanan informasi pribadi Anda saat Anda melakukan pemesanan atau memasukkan, mengirimkan, atau mengakses informasi pribadi Anda. Kami menawarkan penggunaan server yang aman. Semua informasi sensitif/kredensial yang diberikan ditransmisikan melalui teknologi Secure Socket Layer (SSL) dan kemudian dienkripsi ke dalam basis data penyedia gerbang pembayaran kami hanya untuk dapat diakses oleh mereka yang berwenang dengan hak akses khusus ke sistem tersebut, dan diwajibkan untuk menjaga kerahasiaan informasi tersebut. Setelah terjadinya transaksi, Informasi Pribadi Anda yang terkait (kartu kredit, nomor jaminan sosial, keuangan, dll) tidak pernah disimpan secara online. Kami tidak dapat, bagaimanapun, memastikan atau menjamin keamanan mutlak dari setiap informasi yang Anda kirimkan kepada kami atau menjamin bahwa informasi Anda pada Layanan tidak dapat diakses, diungkapkan, diubah, atau dihancurkan oleh pelanggaran fisik, teknis, atau manajerial keamanan kami.\n 2. Kecuali sebagaimana diatur lain dalam Kebijakan Privasi ini, SpendWise akan menjaga kerahasiaan Informasi Pribadi. SpendWise tidak akan membagikannya kepada para pihak ketiga, kecuali SpendWise meyakini dengan itikad baik bahwa pengungkapan Informasi Pribadi Anda atau setiap informasi lainnya yang SpendWise kumpulkan mengenai Anda dibutuhkan untuk Penggunaan yang Diperbolehkan atau untuk:', style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),),
                    Text('• Mematuhi putusan pengadilan atau proses hukum lainnya;\n• Melindungi hak, properti atau keselamatan SpendWise;\n• Memberlakukan Perjanjian, termasuk Syarat dan Ketentuan;\n• Menanggapi klaim-klaim bahwa terdapat posting atau konten lainnya yang melanggar hak-hak para pihak ketiga; atau\n• Penggunaan yang Diperbolehkan berdasarkan Kebijakan Privasi ini.', style: GoogleFonts.aBeeZee(
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