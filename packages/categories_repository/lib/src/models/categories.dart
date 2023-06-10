// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Categories extends Equatable {
  final String id;
  final String? displayName;
  Categories({
    String? id,
    this.displayName,
  }) : id = id ?? Uuid().v4();

  Categories copyWith({
    String? id,
    String? displayName,
  }) {
    return Categories(
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

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
    );
  }

  factory Categories.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Categories(
      id: snapshot.id,
      displayName: data?['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, displayName];
}
