// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String displayName;
  final String description;
  final num price;
  final bool isAvailable;
  final String imageUrl;
  const Food({
    required this.id,
    required this.displayName,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.imageUrl,
  });

  Food copyWith({
    String? id,
    String? displayName,
    String? description,
    num? price,
    bool? isAvailable,
    String? imageUrl,
  }) {
    return Food(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'imageUrl': imageUrl,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      isAvailable: map['isAvailable'] as bool,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory Food.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Food(
      id: snapshot.id,
      displayName: data?['displayName'],
      description: data?['description'],
      price: data?['price'],
      isAvailable: data?['isAvailable'],
      imageUrl: data?['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      displayName,
      description,
      price,
      isAvailable,
      imageUrl,
    ];
  }
}
