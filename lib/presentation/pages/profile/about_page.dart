import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/utils/text_style.dart';
import '../../../injection_container.dart';
import '../../cubit/auth/get_user/get_user_cubit.dart';
import '../../widgets/profile/profile_bg_section.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = '--';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = 'V ${packageInfo.version}';
      });
    } catch (e) {
      setState(() {
        appVersion = '--';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetUserCubit>()..getData(),
      child: _content(),
    );
  }

  Widget _content() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            const ProfileBgSection(),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    'About this Application',
                    style: AppTextStyle.headingPrimary,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                        style: AppTextStyle.mediumThin,
                        children: [
                          TextSpan(
                            text: 'Grand Laswi Cash Manager/GL CashMan',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' adalah sebuah aplikasi yang dirancang khusus untuk memfasilitasi ',
                          ),
                          TextSpan(
                            text: 'pengelolaan keuangan kas',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(
                            text:
                                ' di komplek Grand Laswi. Dengan fitur-fitur unggulannya, aplikasi ini tidak hanya menyederhanakan proses rekapitulasi keuangan, tetapi juga memberikan bukti pembayaran yang akurat dan mudah diakses. Selain itu, GL CashMan memberikan kemudahan dalam mengelola transaksi keuangan sehari-hari di komplek, menjadikan pengalaman pengguna lebih efisien dan efektif.',
                          ),
                          TextSpan(
                            text: '\n\n\nFitur Unggulan GL CashMan\n\n',
                            style: AppTextStyle.bodyBoldPrimary,
                          ),
                          TextSpan(
                            text:
                                '1. Bukti Pembayaran Digital: Setiap pembayaran yang dilakukan melalui aplikasi akan mendapatkan bukti pembayaran digital yang dapat diunduh atau dicetak. Ini memudahkan warga untuk menyimpan dan mengakses bukti pembayaran kapan saja.\n',
                          ),
                          TextSpan(
                            text:
                                '2. Pengelolaan Dana Kas: Aplikasi ini menyediakan alat untuk memantau aliran masuk dan keluar dana kas secara real-time, membantu pengurus komplek untuk mengelola anggaran dengan lebih baik.\n',
                          ),
                          TextSpan(
                            text:
                                '3. User-Friendly Interface: GL CashMan didesain dengan antarmuka yang intuitif dan mudah digunakan, sehingga pengguna dari berbagai usia dapat mengoperasikannya tanpa kesulitan.\n',
                          ),
                          TextSpan(
                            text: '\n\nManfaat Menggunakan GL CashMan\n\n',
                            style: AppTextStyle.bodyBoldPrimary,
                          ),
                          TextSpan(
                            text:
                                '1. Efisiensi Waktu dan Tenaga: Dengan otomatisasi dan digitalisasi proses keuangan, pengguna dapat menghemat waktu dan tenaga yang biasanya dihabiskan untuk pencatatan manual.\n',
                          ),
                          TextSpan(
                            text:
                                '2. Transparansi Keuangan: Semua transaksi tercatat dengan jelas dan transparan, memungkinkan pengurus komplek dan warga untuk memantau keuangan dengan lebih baik.\n',
                          ),
                          TextSpan(
                            text:
                                '3. Kemudahan Akses Informasi: Informasi keuangan dapat diakses kapan saja, di mana saja, memudahkan pengguna untuk mendapatkan data yang mereka butuhkan dengan cepat.\n',
                          ),
                          TextSpan(
                            text:
                                '4. Pengelolaan Keuangan yang Lebih Baik: Dengan fitur analisis dan pelaporan, pengguna dapat membuat keputusan keuangan yang lebih baik dan strategis.\n',
                          ),
                          TextSpan(
                            text:
                                '\nDengan GL CashMan, pengelolaan keuangan di komplek Grand Laswi menjadi lebih sederhana, efisien, dan transparan. Aplikasi ini dirancang untuk memenuhi kebutuhan pengelolaan keuangan yang modern.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    'App Version',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    appVersion,
                    style: AppTextStyle.bodyBoldPrimary,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '© Copyright 2024 by Grand Laswi, Al Right Reserved',
                    style: AppTextStyle.mediumThin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
