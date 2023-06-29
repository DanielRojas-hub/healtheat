// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:petition_repository/petition_repository.dart';
import 'package:uuid/uuid.dart';

class Order extends Equatable {
  final String? userId;
  final String? restaurantId;
  final List<Petition>? petitions;
  final int status;
  final String id;

  Order({
    required this.userId,
    required this.restaurantId,
    this.petitions,
    required this.status,
    String? id,
  }) : id = id ?? Uuid().v4();

  Order copyWith({
    String? userId,
    String? restaurantId,
    List<Petition>? petitions,
    int? status,
    String? id,
  }) {
    return Order(
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      petitions: petitions ?? this.petitions,
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'restaurantId': restaurantId,
      'petitions': petitions?.map((x) => x.toMap()).toList(),
      'status': status,
      'id': id,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      userId: map['userId'] != null ? map['userId'] as String : null,
      restaurantId:
          map['restaurantId'] != null ? map['restaurantId'] as String : null,
      petitions: map['petitions'] != null
          ? List<Petition>.from(
              (map['petitions'] as List<int>).map<Petition?>(
                (x) => Petition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] as int,
      id: map['id'] as String,
    );
  }

  factory Order.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    return Order(
      id: snapshot.id,
      userId: data?['userId'],
      restaurantId: data?['restaurantId'],
      status: data?['status'],
      petitions: data?['petitions'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      userId,
      restaurantId,
      petitions,
      status,
      id,
    ];
  }
}
