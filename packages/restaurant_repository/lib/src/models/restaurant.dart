// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Restaurant extends Equatable {
  final String id;
  final String? displayName;
  final List<String>? preferenceIds;
  final String? address;
  final String? phoneNumber;
  final num? rating;
  final String? openTime;
  final String? closeTime;
  final String? imageUrl;
  final String? deliveryTimeRange;
  final String? deliveryPriceRange;

  Restaurant({
    required this.id,
    required this.displayName,
    this.preferenceIds,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.openTime,
    required this.closeTime,
    required this.imageUrl,
    required this.deliveryTimeRange,
    required this.deliveryPriceRange,
  });

  Restaurant copyWith({
    String? id,
    String? displayName,
    List<String>? preferenceIds,
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
      preferenceIds: map['preferenceIds'] != null
          ? List<String>.from(map['preferenceIds'])
          : null,
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
