// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_repository/food_repository.dart';

class Petition extends Equatable {
  final String foodId;
  final int quantity;
  final Food food;
  final String id;

  const Petition({
    required this.foodId,
    required this.quantity,
    required this.food,
    required this.id,
  });

  Petition copyWith({
    String? foodId,
    int? quantity,
    Food? food,
    String? id,
  }) {
    return Petition(
      foodId: foodId ?? this.foodId,
      quantity: quantity ?? this.quantity,
      food: food ?? this.food,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodId': foodId,
      'quantity': quantity,
      'food': food.toMap(),
      'id': id,
    };
  }

  factory Petition.fromMap(Map<String, dynamic> map) {
    return Petition(
      foodId: map['foodId'] as String,
      quantity: map['quantity'] as int,
      food: Food.fromMap(map['food'] as Map<String, dynamic>),
      id: map['id'] as String,
    );
  }

  factory Petition.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Petition(
      id: snapshot.id,
      foodId: data?['foodId'],
      quantity: data?['quantity'],
      food: Food.fromMap(data?['food'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Petition.fromJson(String source) =>
      Petition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [foodId, quantity, food, id];
}
