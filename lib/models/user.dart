// ignore_for_file: file_names

class UserFields {
  static const String id = 'id';
  static const String fullname = 'fullname';
  static const String email = 'email';
  static const String address = 'address';
  static const String isEmployee = 'isEmployee';
  static const String isManager = 'isManager';
  static const String isOwner = 'isOwner';
  static const String isSuperuser = 'isSuperuser';

  static List<String> getFields() => [
        id,
        fullname,
        email,
        address,
        isEmployee,
        isManager,
        isOwner,
        isSuperuser
      ];
}

class User {
  final int? id;
  final String fullname;
  final String email;
  final String address;
  final bool isEmployee;
  final bool isManager;
  final bool isOwner;
  final bool isSuperuser;

  const User({
    this.id,
    required this.fullname,
    required this.email,
    required this.address,
    required this.isEmployee,
    required this.isManager,
    required this.isOwner,
    required this.isSuperuser,
  });

  User copy({
    int? id,
    String? fullname,
    String? email,
    String? address,
    bool? isEmployee,
    bool? isManager,
    bool? isOwner,
    bool? isSuperuser,
  }) =>
      User(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        address: address ?? this.address,
        isEmployee: isEmployee ?? this.isEmployee,
        isManager: isManager ?? this.isManager,
        isOwner: isOwner ?? this.isOwner,
        isSuperuser: isSuperuser ?? this.isSuperuser,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json[UserFields.id],
        fullname: json[UserFields.fullname],
        email: json[UserFields.email],
        address: json[UserFields.address],
        isEmployee: json[UserFields.isEmployee],
        isManager: json[UserFields.isManager],
        isOwner: json[UserFields.isOwner],
        isSuperuser: json[UserFields.isSuperuser],
      );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.fullname: fullname,
        UserFields.email: email,
        UserFields.address: address,
        UserFields.isEmployee: isEmployee,
        UserFields.isManager: isManager,
        UserFields.isSuperuser: isSuperuser
      };
}

class UserProfile {
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String about;
  final bool isDarkmode;

  const UserProfile({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.about,
    required this.isDarkmode,
  });
}
