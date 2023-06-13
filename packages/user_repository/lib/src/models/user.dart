import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class User extends Equatable {
  final String? id;
  final String? displayName;
  final String? email;
  final Phone? phone;
  final List<String>? favFoods;
  final List<String>? favRestaurants;

  const User({
    this.id,
    this.displayName,
    this.email,
    this.phone,
    this.favFoods,
    this.favRestaurants,
  });

  User copyWith({
    String? id,
    String? displayName,
    String? email,
    Phone? phone,
    List<String>? favFoods,
    List<String>? favRestaurants,
  }) {
    return User(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      favFoods: favFoods ?? this.favFoods,
      favRestaurants: favRestaurants ?? this.favRestaurants,
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
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
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
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return User(
      id: snapshot.id,
      displayName: data?['displayName'],
      email: data?['email'],
      phone: Phone.fromMap(data?['phone']),
      favFoods: data?['favFoods'] != null
          ? List<String>.from(data?['favFoods'])
          : null,
      favRestaurants: data?['favRestaurants'] != null
          ? List<String>.from(data?['favRestaurants'])
          : null,
    );
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
    ];
  }
}
