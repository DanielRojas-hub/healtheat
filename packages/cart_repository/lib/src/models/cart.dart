// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String restaurantId;
  final List<Petition> petitions;

  const Cart({
    required this.restaurantId,
    required this.petitions,
  });

  static const empty = Cart(restaurantId: '', petitions: []);

  bool get isEmpty => this == Cart.empty;
  bool get isNotEmpty => !isEmpty;

  Cart copyWith({
    String? restaurantId,
    List<Petition>? petitions,
  }) {
    return Cart(
      restaurantId: restaurantId ?? this.restaurantId,
      petitions: petitions ?? this.petitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurantId': restaurantId,
      'petitions': petitions.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      restaurantId: map['restaurantId'] as String,
      petitions: List<Petition>.from(
        (map['petitions'] as List<int>).map<Petition>(
          (x) => Petition.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [restaurantId, petitions];
}
