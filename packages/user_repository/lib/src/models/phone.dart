// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Phone extends Equatable {
  final String? country;
  final String? phoneCode;
  final String? phoneNumber;

  const Phone({
    this.country,
    this.phoneCode,
    this.phoneNumber,
  });

  Phone copyWith({
    String? country,
    String? phoneCode,
    String? phoneNumber,
  }) {
    return Phone(
      country: country ?? this.country,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'phoneCode': phoneCode,
      'phoneNumber': phoneNumber,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      country: map['country'] != null ? map['country'] as String : null,
      phoneCode: map['phoneCode'] != null ? map['phoneCode'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [country, phoneCode, phoneNumber];
}
