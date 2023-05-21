// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Restaurant {
  final String id;
  Restaurant({
    required this.id,
  });

  Restaurant copyWith({
    String? id,
  }) {
    return Restaurant(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Restaurant(id: $id)';

  @override
  bool operator ==(covariant Restaurant other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
