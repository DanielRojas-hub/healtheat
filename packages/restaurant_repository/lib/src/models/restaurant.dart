// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Restaurant extends Equatable {
  final String id;
  final String? displayName;
  final List<String>? preferenceIds;
  final List<String>? menuIds;
  final List<String>? categoryIds;
  final List<String>? cuisineIds;

  final String? address;
  final String? phoneNumber;
  final num? rating;
  final String? openTime;
  final String? closeTime;
  final String? imageUrl;
  final String? deliveryTimeRange;
  final String? deliveryPriceRange;

  Restaurant({
    String? id,
    required this.displayName,
    required this.preferenceIds,
    required this.menuIds,
    required this.categoryIds,
    required this.cuisineIds,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.openTime,
    required this.closeTime,
    required this.imageUrl,
    required this.deliveryTimeRange,
    required this.deliveryPriceRange,
  }) : id = id ?? Uuid().v4();

  Restaurant copyWith({
    String? id,
    String? displayName,
    List<String>? preferenceIds,
    List<String>? menuIds,
    List<String>? categoryIds,
    List<String>? cuisineIds,
    String? address,
    String? phoneNumber,
    num? rating,
    String? openTime,
    String? closeTime,
    String? imageUrl,
    String? deliveryTimeRange,
    String? deliveryPriceRange,
  }) {
    return Restaurant(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      preferenceIds: preferenceIds ?? this.preferenceIds,
      menuIds: menuIds ?? this.menuIds,
      categoryIds: categoryIds ?? this.categoryIds,
      cuisineIds: cuisineIds ?? this.cuisineIds,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      imageUrl: imageUrl ?? this.imageUrl,
      deliveryTimeRange: deliveryTimeRange ?? this.deliveryTimeRange,
      deliveryPriceRange: deliveryPriceRange ?? this.deliveryPriceRange,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'preferenceIds': preferenceIds,
      'menuIds': menuIds,
      'categoryIds': categoryIds,
      'cuisineIds': cuisineIds,
      'address': address,
      'phoneNumber': phoneNumber,
      'rating': rating,
      'openTime': openTime,
      'closeTime': closeTime,
      'imageUrl': imageUrl,
      'deliveryTimeRange': deliveryTimeRange,
      'deliveryPriceRange': deliveryPriceRange,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      preferenceIds:
          map['preferenceIds'] != null ? List.from(map['preferenceIds']) : null,
      menuIds: map['menuIds'] != null ? List.from(map['menuIds']) : null,
      categoryIds:
          map['categoryIds'] != null ? List.from(map['categoryIds']) : null,
      cuisineIds:
          map['cuisineIds'] != null ? List.from(map['cuisineIds']) : null,
      address: map['address'] != null ? map['address'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      openTime: map['openTime'] != null ? map['openTime'] as String : null,
      closeTime: map['closeTime'] != null ? map['closeTime'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      deliveryTimeRange: map['deliveryTimeRange'] != null
          ? map['deliveryTimeRange'] as String
          : null,
      deliveryPriceRange: map['deliveryPriceRange'] != null
          ? map['deliveryPriceRange'] as String
          : null,
    );
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Restaurant(
      id: snapshot.id,
      displayName: data?['displayName'],
      preferenceIds: List<String>.from(data?['preferenceIds'] ?? []),
      address: data?['address'],
      phoneNumber: data?['phoneNumber'],
      rating: data?['rating'],
      openTime: data?['openTime'],
      closeTime: data?['closeTime'],
      imageUrl: data?['imageUrl'],
      deliveryTimeRange: data?['deliveryTimeRange'],
      deliveryPriceRange: data?['deliveryPriceRange'],
      categoryIds: List<String>.from(data?['categoryIds'] ?? []),
      menuIds: List<String>.from(data?['menuIds'] ?? []),
      cuisineIds: List<String>.from(data?['cuisineIds'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurant(id: $id, displayName: $displayName, preferenceIds: $preferenceIds, address: $address, phoneNumber: $phoneNumber, rating: $rating, openTime: $openTime, closeTime: $closeTime, imageUrl: $imageUrl, deliveryTimeRange: $deliveryTimeRange, deliveryPriceRange: $deliveryPriceRange)';
  }

  @override
  bool operator ==(covariant Restaurant other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.displayName == displayName &&
        listEquals(other.preferenceIds, preferenceIds) &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.rating == rating &&
        other.openTime == openTime &&
        other.closeTime == closeTime &&
        other.imageUrl == imageUrl &&
        other.deliveryTimeRange == deliveryTimeRange &&
        other.deliveryPriceRange == deliveryPriceRange;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        displayName.hashCode ^
        preferenceIds.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        rating.hashCode ^
        openTime.hashCode ^
        closeTime.hashCode ^
        imageUrl.hashCode ^
        deliveryTimeRange.hashCode ^
        deliveryPriceRange.hashCode;
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      displayName,
      preferenceIds,
      menuIds,
      categoryIds,
      cuisineIds,
      address,
      phoneNumber,
      rating,
      openTime,
      closeTime,
      imageUrl,
      deliveryTimeRange,
      deliveryPriceRange,
    ];
  }
}
