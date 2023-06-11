import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:uuid/uuid.dart';

class Cuisine extends Equatable {
  final String id;
  final String? displayName;
  Cuisine({
    String? id,
    this.displayName,
  }) : id = id ?? Uuid().v4();

  Cuisine copyWith({
    String? id,
    String? displayName,
  }) {
    return Cuisine(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'displayName': displayName,
    };
  }

  factory Cuisine.fromMap(Map<String, dynamic> map) {
    return Cuisine(
      id: map['id'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
    );
  }

  factory Cuisine.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Cuisine(
      id: snapshot.id,
      displayName: data?['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cuisine.fromJson(String source) =>
      Cuisine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, displayName];
}
