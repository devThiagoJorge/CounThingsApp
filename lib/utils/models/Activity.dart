import 'dart:convert';

import 'package:counthings_app/utils/models/Payment.dart';

List<Activity> activityModelsFromJson(String str) =>
    List<Activity>.from(jsonDecode(str).map((x) => Activity.fromJson(x)));

String userModelsToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  final num id;
  final String name;
  final num quantity;
  final num total;
  final DateTime? createdAt;
  final bool itsCalculable;
  final List<Payment>? payments;

  const Activity(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.total,
      required this.createdAt,
      required this.itsCalculable,
      required this.payments});

  // factory Activity.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       'id': int id,
  //       'name': String name,
  //       'quantity': int quantity,
  //       'total': double total,
  //       'createdAt': DateTime createdAt,
  //       'itsCalculable': bool itsCalculable,
  //       'payments': List<Payment> payments
  //     } =>
  //       Activity(
  //           id: id,
  //           name: name,
  //           quantity: quantity,
  //           total: total,
  //           createdAt: createdAt,
  //           itsCalculable: itsCalculable,
  //           payments: payments),
  //     _ => throw const FormatException('Failed to load activity.'),
  //   };
  // }

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
      id: json["id"],
      name: json["name"],
      quantity: json["quantity"],
      total: json["total"],
      createdAt: DateTime.tryParse(json["createdAt"]),
      itsCalculable: json["itsCalculable"],
      payments: List<Payment>.from(json["payments"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "total": total,
        "createdAt": createdAt,
        "itsCalculable": itsCalculable,
        "payments": payments
      };
}
