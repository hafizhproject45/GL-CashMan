import 'package:equatable/equatable.dart';

class UpdateRequestEntity extends Equatable {
  final String? id;
  final String fullname;
  final String block;
  final String contact;
  final String email;
  final String? updatedAt;

  const UpdateRequestEntity({
    this.id,
    required this.fullname,
    required this.block,
    required this.contact,
    required this.email,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'block': block,
      'contact': contact,
      'email': email,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      fullname,
      block,
      contact,
      email,
      updatedAt,
    ];
  }
}
