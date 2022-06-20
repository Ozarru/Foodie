class CourierFields {
  static const String id = 'id';
  static const String fullname = 'fullname';
  static const String address = 'address';
  static const String deliveries = 'deliveries';

  static List<String> getFields() => [
        id,
        fullname,
        deliveries,
        address,
      ];
}

class Courier {
  final int? id;
  final String fullname;
  final String address;
  final int deliveries;

  const Courier({
    this.id,
    required this.fullname,
    required this.deliveries,
    required this.address,
  });

  static Courier fromJson(Map<String, dynamic> json) => Courier(
        id: json[CourierFields.id],
        fullname: json[CourierFields.fullname],
        deliveries: json[CourierFields.deliveries],
        address: json[CourierFields.address],
      );

  Map<String, dynamic> toJson() => {
        CourierFields.id: id,
        CourierFields.fullname: fullname,
        CourierFields.deliveries: deliveries,
        CourierFields.address: address,
      };
}
