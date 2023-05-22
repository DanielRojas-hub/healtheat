// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String? restaurantId;
  final String? displayName;
  final String? description;
  final String? imageUrl;
  final num? price;
  final bool? isAvailable;

  const Food({
    required this.id,
    required this.restaurantId,
    required this.displayName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
  });

  Food copyWith({
    String? id,
    String? restaurantId,
    String? displayName,
    String? description,
    String? imageUrl,
    num? price,
    bool? isAvailable,
  }) {
    return Food(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'restaurantId': restaurantId,
      'displayName': displayName,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'isAvailable': isAvailable,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as String,
      restaurantId:
          map['restaurantId'] != null ? map['restaurantId'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      isAvailable:
          map['isAvailable'] != null ? map['isAvailable'] as bool : null,
    );
  }

  factory Food.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Food(
      id: snapshot.id,
      restaurantId: data?['restaurantId'],
      displayName: data?['displayName'],
      description: data?['description'],
      imageUrl: data?['imageUrl'],
      price: data?['price'],
      isAvailable: data?['isAvailable'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      restaurantId,
      displayName,
      description,
      imageUrl,
      price,
      isAvailable,
    ];
  }
}
