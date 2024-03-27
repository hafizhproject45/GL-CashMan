import 'package:cloud_firestore/cloud_firestore.dart';

class M_user {
  final String? id;
  final String? fullname;
  final String? block;
  final String? contact;
  final String? email;
  final String? createdAt;

  M_user({
    this.id,
    this.fullname,
    this.block,
    this.contact,
    this.email,
    this.createdAt,
  });

  static M_user fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return M_user(
      id: snapshot['id'],
      fullname: snapshot['fullname'],
      block: snapshot['block'],
      contact: snapshot['contact'],
      email: snapshot['email'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullname": fullname,
      "block": block,
      "contact": contact,
      "email": email,
      "createdAt": createdAt.toString(),
    };
  }
}
