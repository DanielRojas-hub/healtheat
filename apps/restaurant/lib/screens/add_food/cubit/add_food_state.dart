part of 'add_food_cubit.dart';

class AddFoodState extends Equatable {
  final NotEmptyString displayName;
  final IsNumeric price;
  final NotEmptyString description;
  final File? image;
  final List<String> categoryIds;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final bool isRestarting;

  const AddFoodState({
    this.displayName = const NotEmptyString.pure(),
    this.price = const IsNumeric.pure(),
    this.description = const NotEmptyString.pure(),
    this.image,
    this.categoryIds = const [],
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.isRestarting = false,
  });

  AddFoodState copyWith({
    NotEmptyString? displayName,
    IsNumeric? price,
    NotEmptyString? description,
    File? image,
    List<String>? categoryIds,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? isRestarting,
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
      isRestarting: isRestarting ?? this.isRestarting,
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
      isRestarting,
    ];
  }
}
