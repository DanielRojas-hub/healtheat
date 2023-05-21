// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Restaurant {
  final String id;
  final String displayName;
  final List<String> categoryRestaurantIds;
  final String address;
  final String phoneNumber;
  final num rating;
  final DateTime openTime;
  final DateTime closeTime;

  Restaurant({
    required this.id,
    required this.displayName,
    required this.categoryRestaurantIds,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.openTime,
    required this.closeTime,
  });

  Restaurant copyWith({
    String? id,
    String? displayName,
    List<String>? categoryRestaurantIds,
    String? address,
    String? phoneNumber,
    num? rating,
    DateTime? openTime,
    DateTime? closeTime,
  }) {
    return Restaurant(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      categoryRestaurantIds:
          categoryRestaurantIds ?? this.categoryRestaurantIds,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'categoryRestaurantIds': categoryRestaurantIds,
      'address': address,
      'phoneNumber': phoneNumber,
      'rating': rating,
      'openTime': openTime.millisecondsSinceEpoch,
      'closeTime': closeTime.millisecondsSinceEpoch,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      categoryRestaurantIds: List<String>.from(map['categoryRestaurantIds']),
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      rating: map['rating'] as num,
      openTime: DateTime.fromMillisecondsSinceEpoch(map['openTime'] as int),
      closeTime: DateTime.fromMillisecondsSinceEpoch(map['closeTime'] as int),
    );
  }

  factory Restaurant.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Restaurant(
      id: snapshot.id,
      displayName: data?['displayName'],
      categoryRestaurantIds: data?['categoryRestaurantIds'],
      address: data?['address'],
      phoneNumber: data?['phoneNumber'],
      rating: data?['rating'],
      openTime: data?['openTime'],
      closeTime: data?['closeTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurant(id: $id, displayName: $displayName, categoryRestaurantIds: $categoryRestaurantIds, address: $address, phoneNumber: $phoneNumber, rating: $rating, openTime: $openTime, closeTime: $closeTime)';
  }

  @override
  bool operator ==(covariant Restaurant other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.displayName == displayName &&
        listEquals(other.categoryRestaurantIds, categoryRestaurantIds) &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.rating == rating &&
        other.openTime == openTime &&
        other.closeTime == closeTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        displayName.hashCode ^
        categoryRestaurantIds.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        rating.hashCode ^
        openTime.hashCode ^
        closeTime.hashCode;
  }
}
