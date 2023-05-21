// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final num delivery;
  final num subtotal;
  final num total;
  final num discount;
  final List<Petition> petitions;

  const Cart({
    required this.delivery,
    required this.subtotal,
    required this.total,
    required this.discount,
    required this.petitions,
  });

  Cart copyWith({
    num? delivery,
    num? subtotal,
    num? total,
    num? discount,
    List<Petition>? petitions,
  }) {
    return Cart(
      delivery: delivery ?? this.delivery,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      discount: discount ?? this.discount,
      petitions: petitions ?? this.petitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'delivery': delivery,
      'subtotal': subtotal,
      'total': total,
      'discount': discount,
      'petitions': petitions.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      delivery: map['delivery'] as num,
      subtotal: map['subtotal'] as num,
      total: map['total'] as num,
      discount: map['discount'] as num,
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
  List<Object> get props {
    return [
      delivery,
      subtotal,
      total,
      discount,
      petitions,
    ];
  }
}
