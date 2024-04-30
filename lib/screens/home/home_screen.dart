import 'package:flutter/material.dart';
import 'package:gl_app/widgets/contactList_widget.dart';

import '../../widgets/carousel_widget.dart';
import '../../styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  });

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
                  SizedBox(height: 30),
                  Text(
                    'Selamat datang di ',
                    style: TextPrimary.thin,
                  ),
                  Text('GL Manager APP', style: TextPrimary.header),
                  SizedBox(height: 20),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(height: 30),
                  CarouselWidget(),
                  SizedBox(height: 30),
                  Container(
                    width: screenWidth * 0.9,
                    child: RichText(
                      text: TextSpan(
                        style: TextGrey.thin.copyWith(
                          height: 1.8,
                        ),
                        children: [
                          TextSpan(
                              text: '${' ' * 5}GL Manager APP',
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          TextSpan(
                            text:
                                ' adalah sebuah aplikasi yang dirancang khusus untuk memfasilitasi ',
                          ),
                          TextSpan(
                              text: 'pengelolaan keuangan kas',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' di komplek "Grand Laswi". Dengan fitur-fitur unggulannya, aplikasi ini tidak hanya menyederhanakan proses rekapitulasi keuangan, tetapi juga memberikan bukti pembayaran yang akurat dan mudah diakses. Selain itu, GL Manager APP memberikan kemudahan dalam mengelola transaksi keuangan sehari-hari di komplek, menjadikan pengalaman pengguna lebih efisien dan efektif.')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Ada Pertanyaan?',
                              style: TextBlack.thin,
                            ),
                            SizedBox(height: 10),
                            ContactListWidget(
                              name: "WA ADMIN",
                              contactNumber: "+6285175435207",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Terima Kasih',
                        style: TextBlack.body,
                      ),
                      Text(
                        'Telah menggunakan aplikasi ini.',
                        style: TextGrey.thin,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
