// ignore_for_file: file_names

import 'models.dart';

class EatryFields {
  static const String id = 'id';
  static const String admin = 'admin';
  static const String name = 'name';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String address = 'address';
  static const String employees = 'employees';
  static const String managers = 'managers';
  static const String owners = 'owners';
  static const String admins = 'admins';
  static const String isPromoted = 'isPromoted';
  static const String isVerified = 'isVerified';

  static List<String> getFields() => [
        id,
        name,
        email,
        address,
        employees,
        managers,
        owners,
        isPromoted,
        isVerified
      ];
}

class Eatry {
  final int? id;
  final User admin;
  final String name;
  final String email;
  final String address;
  final String phone;
  final int? employees;
  final int? managers;
  final int? owners;
  final bool? isPromoted;
  final bool? isVerified;

  const Eatry({
    this.id,
    required this.admin,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    this.employees,
    this.managers,
    this.owners,
    this.isPromoted,
    this.isVerified,
  });

  Eatry copy({
    int? id,
    User? admin,
    String? name,
    String? email,
    String? address,
    String? phone,
    int? employees,
    int? managers,
    int? owners,
    bool? isPromoted,
    bool? isVerified,
  }) =>
      Eatry(
        id: id ?? this.id,
        admin: admin ?? this.admin,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: address ?? this.phone,
        employees: employees ?? this.employees,
        managers: managers ?? this.managers,
        owners: owners ?? this.owners,
        isPromoted: isPromoted ?? this.isPromoted,
        isVerified: isVerified ?? this.isVerified,
      );

  static Eatry fromJson(Map<String, dynamic> json) => Eatry(
        id: json[EatryFields.id],
        admin: json[EatryFields.admin],
        name: json[EatryFields.name],
        email: json[EatryFields.email],
        address: json[EatryFields.address],
        phone: json[EatryFields.phone],
        employees: json[EatryFields.employees],
        managers: json[EatryFields.managers],
        owners: json[EatryFields.owners],
        isPromoted: json[EatryFields.isPromoted],
        isVerified: json[EatryFields.isVerified],
      );

  Map<String, dynamic> toJson() => {
        EatryFields.id: id,
        EatryFields.admin: admin,
        EatryFields.name: name,
        EatryFields.email: email,
        EatryFields.address: address,
        EatryFields.phone: phone,
        EatryFields.employees: employees,
        EatryFields.managers: managers,
        EatryFields.owners: owners,
        EatryFields.isPromoted: isPromoted,
        EatryFields.isVerified: isVerified
      };
}

class EatryProfile {
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String about;
  final bool isDarkmode;

  const EatryProfile({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.about,
    required this.isDarkmode,
  });
}
