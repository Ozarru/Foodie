import 'models.dart';

class CourierFields {
  static const String id = 'id';
  static const String user = 'user';
  static const String deliveries = 'deliveries';
  static const String rating = 'rating';

  static List<String> getFields() => [
        id,
        user,
        deliveries,
        rating,
      ];
}

class Courier {
  final int? id;
  final User user;
  final int deliveries;
  final int? rating;

  const Courier({
    this.id,
    this.rating,
    required this.user,
    required this.deliveries,
  });

  static Courier fromJson(Map<String, dynamic> json) => Courier(
        id: json[CourierFields.id],
        user: json[CourierFields.user],
        deliveries: json[CourierFields.deliveries],
        rating: json[CourierFields.rating] = 1,
      );

  Map<String, dynamic> toJson() => {
        CourierFields.id: id,
        CourierFields.user: user,
        CourierFields.deliveries: deliveries,
        CourierFields.rating: rating,
      };
}
