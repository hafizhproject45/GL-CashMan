import 'package:cloud_firestore/cloud_firestore.dart';

class M_User {
  final String? id;
  final String? fullname;
  final String? block;
  final String? contact;
  final String? email;
  final String? createdAt;
  final String? updateAt;

  M_User({
    this.id,
    this.fullname,
    this.block,
    this.contact,
    this.email,
    this.createdAt,
    this.updateAt,
  });

  static M_User fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return M_User(
      id: snapshot['id'],
      fullname: snapshot['fullname'],
      block: snapshot['block'],
      contact: snapshot['contact'],
      email: snapshot['email'],
      createdAt: snapshot['createdAt'],
      updateAt: snapshot['updateAt'],
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
      "updateAt": updateAt.toString(),
    };
  }
}
