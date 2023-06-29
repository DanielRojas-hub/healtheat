// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UserPreference extends Equatable {
  final String id;
  final String? displayName;
  final List<String> preferenceIds;

  UserPreference({
    String? id,
    required this.displayName,
    required this.preferenceIds,
  }) : id = id ?? Uuid().v4();

  UserPreference copyWith({
    String? id,
    String? displayName,
    List<String>? preferenceIds,
  }) {
    return UserPreference(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      preferenceIds: preferenceIds ?? this.preferenceIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
      'preferenceIds': preferenceIds,
    };
  }

  factory UserPreference.fromMap(Map<String, dynamic> map) {
    return UserPreference(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      preferenceIds: List<String>.from(map['preferenceIds']),
    );
  }

  factory UserPreference.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return UserPreference(
      id: snapshot.id,
      displayName: data?['displayName'],
      preferenceIds: List<String>.from(data?['preferenceIds'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPreference.fromJson(String source) =>
      UserPreference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, displayName, preferenceIds];
}
