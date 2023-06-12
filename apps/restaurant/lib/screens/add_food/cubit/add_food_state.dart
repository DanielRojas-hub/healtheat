part of 'add_food_cubit.dart';

class AddFoodState extends Equatable {
  final NotEmptyString displayName;
  final IsNumeric price;
  final NotEmptyString description;
  final Image? image;
  final List<String> categoryIds;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  const AddFoodState({
    this.displayName = const NotEmptyString.pure(),
    this.price = const IsNumeric.pure(),
    this.description = const NotEmptyString.pure(),
    this.image,
    this.categoryIds = const [],
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  AddFoodState copyWith({
    NotEmptyString? displayName,
    IsNumeric? price,
    NotEmptyString? description,
    Image? image,
    List<String>? categoryIds,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return AddFoodState(
      displayName: displayName ?? this.displayName,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      categoryIds: categoryIds ?? this.categoryIds,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      displayName,
      price,
      description,
      image,
      categoryIds,
      status,
      isValid,
      errorMessage,
    ];
  }
}
