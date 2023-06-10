// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Menu extends Equatable {
  final String id;
  final String? displayName;
  Menu({
    String? id,
    this.displayName,
  }) : id = id ?? Uuid().v4();

  Menu copyWith({
    String? id,
    String? displayName,
  }) {
    return Menu(
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

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as String,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
    );
  }

  factory Menu.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Menu(
      id: snapshot.id,
      displayName: data?['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) =>
      Menu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, displayName];
}
