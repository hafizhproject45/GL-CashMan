import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';
import '../../widgets/carousel_widget.dart';
import '../../widgets/contactList_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Selamat datang di ',
                    style: AppTextStyle.medium,
                  ),
                  const Text('GL Manager APP', style: AppTextStyle.heading),
                  const SizedBox(height: 20),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(height: 30),
                  const CarouselWidget(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyle.medium.copyWith(
                          height: 1.8,
                        ),
                        children: [
                          TextSpan(
                              text: '${' ' * 5}GL Manager APP',
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic)),
                          const TextSpan(
                            text:
                                ' adalah sebuah aplikasi yang dirancang khusus untuk memfasilitasi ',
                          ),
                          const TextSpan(
                              text: 'pengelolaan keuangan kas',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text:
                                  ' di komplek "Grand Laswi". Dengan fitur-fitur unggulannya, aplikasi ini tidak hanya menyederhanakan proses rekapitulasi keuangan, tetapi juga memberikan bukti pembayaran yang akurat dan mudah diakses. Selain itu, GL Manager APP memberikan kemudahan dalam mengelola transaksi keuangan sehari-hari di komplek, menjadikan pengalaman pengguna lebih efisien dan efektif.')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Ada Pertanyaan?',
                            style: AppTextStyle.medium,
                          ),
                          SizedBox(height: 10),
                          ContactListWidget(
                            name: "WA ADMIN",
                            contactNumber: "+6285175435207",
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Terima Kasih',
                        style: AppTextStyle.body,
                      ),
                      Text(
                        'Telah menggunakan aplikasi ini.',
                        style: AppTextStyle.medium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
