import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class User extends Equatable {
  final String id;
  final String? displayName;
  final String? email;
  final Phone? phone;
  final List<String>? favFoods;
  final List<String>? favRestaurants;
  final String? userPreferenceId;
  final String? restaurantId;

  const User({
    required this.id,
    this.displayName,
    this.email,
    this.phone,
    this.favFoods,
    this.favRestaurants,
    this.userPreferenceId,
    this.restaurantId,
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  User copyWith({
    String? id,
    String? displayName,
    String? email,
    Phone? phone,
    List<String>? favFoods,
    List<String>? favRestaurants,
    String? userPreferenceId,
    String? restaurantId,
  }) {
    return User(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      favFoods: favFoods ?? this.favFoods,
      favRestaurants: favRestaurants ?? this.favRestaurants,
      userPreferenceId: userPreferenceId ?? this.userPreferenceId,
      restaurantId: restaurantId ?? this.restaurantId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'email': email,
      'phone': phone?.toMap(),
      'favFoods': favFoods,
      'favRestaurants': favRestaurants,
      'userPreferenceId': userPreferenceId,
      'restaurantId': restaurantId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null
          ? Phone.fromMap(map['phone'] as Map<String, dynamic>)
          : null,
      favFoods: map['favFoods'] != null ? List.from(map['favFoods']) : null,
      favRestaurants: map['favRestaurants'] != null
          ? List.from(map['favRestaurants'])
          : null,
      userPreferenceId: map['userPreferenceId'] != null
          ? map['userPreferenceId'] as String
          : null,
      restaurantId:
          map['restaurantId'] != null ? map['restaurantId'] as String : null,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return User(
        id: snapshot.id,
        displayName: data?['displayName'],
        email: data?['email'],
        phone: data?['phone'] != null ? Phone.fromMap(data?['phone']) : null,
        favFoods: data?['favFoods'] != null
            ? List<String>.from(data?['favFoods'])
            : null,
        favRestaurants: data?['favRestaurants'] != null
            ? List<String>.from(data?['favRestaurants'])
            : null,
        userPreferenceId: data?['userPreferenceId'],
        restaurantId: data?['restaurantId']);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      displayName,
      email,
      phone,
      favFoods,
      favRestaurants,
      userPreferenceId,
      restaurantId,
    ];
  }
}
