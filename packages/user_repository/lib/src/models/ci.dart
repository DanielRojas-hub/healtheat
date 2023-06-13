// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Ci extends Equatable {
  final String? operator;
  final num? number;

  const Ci({
    this.operator,
    this.number,
  });

  bool checkIfAnyIsNull() {
    return [operator, number].contains(null);
  }

  Ci copyWith({
    String? operator,
    num? number,
  }) {
    return Ci(
      operator: operator ?? this.operator,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operator': operator,
      'number': number,
    };
  }

  factory Ci.fromMap(Map<String, dynamic>? map) {
    return Ci(
      operator: map?['operator'] != null ? map!['operator'] as String : null,
      number: map?['number'] != null ? map!['number'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ci.fromJson(String source) =>
      Ci.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [operator, number];
}
