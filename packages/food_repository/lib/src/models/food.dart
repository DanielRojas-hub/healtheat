// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Food extends Equatable {
  final String id;
  final String restaurantId;
  final String? displayName;
  final String? description;
  final String? imageUrl;
  final num? price;
  final bool? isAvailable;
  final List<String>? preferenceIds;
  final List<String>? menuIds;
  final List<String>? categoryIds;

  Food({
    String? id,
    required this.restaurantId,
    required this.displayName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
    required this.preferenceIds,
    required this.menuIds,
    required this.categoryIds,
  }) : id = id ?? Uuid().v4();

  Food copyWith({
    String? id,
    String? restaurantId,
    String? displayName,
    String? description,
    String? imageUrl,
    num? price,
    bool? isAvailable,
    List<String>? preferenceIds,
    List<String>? menuIds,
    List<String>? categoryIds,
  }) {
    return Food(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      preferenceIds: preferenceIds ?? this.preferenceIds,
      menuIds: menuIds ?? this.menuIds,
      categoryIds: categoryIds ?? this.categoryIds,
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
      'preferenceIds': preferenceIds,
      'menuIds': menuIds,
      'categoryIds': categoryIds,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as String,
      restaurantId: map['restaurantId'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      isAvailable:
          map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      preferenceIds:
          map['preferenceIds'] != null ? List.from(map['preferenceIds']) : null,
      menuIds: map['menuIds'] != null ? List.from(map['menuIds']) : null,
      categoryIds:
          map['categoryIds'] != null ? List.from(map['categoryIds']) : null,
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
      preferenceIds: List<String>.from(data?['preferenceIds'] ?? []),
      categoryIds: List<String>.from(data?['categoryIds'] ?? []),
      menuIds: List<String>.from(data?['menuIds'] ?? []),
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
      preferenceIds,
      menuIds,
      categoryIds,
    ];
  }
}
