part of 'edit_food_cubit.dart';

final class EditFoodState extends Equatable {
  const EditFoodState({
    this.displayName = const NotEmptyString.pure(),
    this.price = const IsNumeric.pure(),
    this.description = const NotEmptyString.pure(),
    this.image,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.isRestarting = false,
    List<String>? categoryIds,
    List<String>? menuIds,
    List<String>? preferenceIds,
  })  : categoryIds = categoryIds ?? const [],
        preferenceIds = preferenceIds ?? const [],
        menuIds = menuIds ?? const [];

  final NotEmptyString displayName;
  final IsNumeric price;
  final NotEmptyString description;
  final File? image;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final bool isRestarting;
  final List<String> categoryIds;
  final List<String> menuIds;
  final List<String> preferenceIds;

  EditFoodState copyWith({
    NotEmptyString? displayName,
    IsNumeric? price,
    NotEmptyString? description,
    File? image,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? isRestarting,
    List<String>? categoryIds,
    List<String>? menuIds,
    List<String>? preferenceIds,
  }) {
    return EditFoodState(
      displayName: displayName ?? this.displayName,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      isRestarting: isRestarting ?? this.isRestarting,
      categoryIds: categoryIds ?? this.categoryIds,
      menuIds: menuIds ?? this.menuIds,
      preferenceIds: preferenceIds ?? this.preferenceIds,
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
      categoryIds,
      preferenceIds,
      menuIds,
    ];
  }
}
