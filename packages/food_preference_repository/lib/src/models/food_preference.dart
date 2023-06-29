// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FoodPreference extends Equatable {
  final String id;
  final String displayName;
  final String description;

  const FoodPreference({
    required this.id,
    required this.displayName,
    required this.description,
  });

  FoodPreference copyWith({
    String? id,
    String? displayName,
    String? description,
  }) {
    return FoodPreference(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'description': description,
    };
  }

  factory FoodPreference.fromMap(Map<String, dynamic> map) {
    return FoodPreference(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      description: map['description'] as String,
    );
  }

  factory FoodPreference.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return FoodPreference(
      id: data?['id'],
      displayName: data?['displayName'],
      description: data?['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodPreference.fromJson(String source) =>
      FoodPreference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, displayName, description];
}
