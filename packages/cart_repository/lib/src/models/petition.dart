// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Petition extends Equatable {
  final String restaurantId;
  final String foodId;
  final int quantity;

  const Petition({
    required this.restaurantId,
    required this.foodId,
    required this.quantity,
  });

  Petition copyWith({
    String? restaurantId,
    String? foodId,
    int? quantity,
  }) {
    return Petition(
      restaurantId: restaurantId ?? this.restaurantId,
      foodId: foodId ?? this.foodId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurantId': restaurantId,
      'foodId': foodId,
      'quantity': quantity,
    };
  }

  factory Petition.fromMap(Map<String, dynamic> map) {
    return Petition(
      restaurantId: map['restaurantId'] as String,
      foodId: map['foodId'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Petition.fromJson(String source) =>
      Petition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [restaurantId, foodId];
}