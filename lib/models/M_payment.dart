import 'package:cloud_firestore/cloud_firestore.dart';

class M_Payment {
  final String? id;
  final String? paymentFrom;
  final String? email;
  final String? month;
  final String? year;
  final String? imageUrl;
  final String? createdAt;

  M_Payment({
    this.id,
    this.paymentFrom,
    this.email,
    this.month,
    this.year,
    this.imageUrl,
    this.createdAt,
  });

  static M_Payment fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return M_Payment(
      id: snapshot['id'],
      paymentFrom: snapshot['paymentFrom'],
      email: snapshot['email'],
      month: snapshot['month'],
      year: snapshot['year'],
      imageUrl: snapshot['imageUrl'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "paymentFrom": paymentFrom,
      "email": email,
      "month": month,
      "year": year,
      "imageUrl": imageUrl,
      "createdAt": createdAt.toString(),
    };
  }
}
