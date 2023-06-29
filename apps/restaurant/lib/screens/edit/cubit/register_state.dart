part of 'register_cubit.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.errorMessage,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.name = const NotEmptyString.pure(),
    this.address = const NotEmptyString.pure(),
    this.code = const NotEmptyString.pure(),
    this.phone = const Phone.pure(),
    this.openingTime = const NotEmptyString.pure(),
    this.closingTime = const NotEmptyString.pure(),
    this.image,
    List<String>? cuisineIds,
    List<String>? categoryIds,
    List<String>? menuIds,
    List<String>? preferenceIds,
  })  : cuisineIds = cuisineIds ?? const [],
        categoryIds = categoryIds ?? const [],
        preferenceIds = preferenceIds ?? const [],
        menuIds = menuIds ?? const [];
  final String? errorMessage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final NotEmptyString name;
  final NotEmptyString address;
  final NotEmptyString code;
  final Phone phone;
  final NotEmptyString openingTime;
  final NotEmptyString closingTime;
  final File? image;
  final List<String> cuisineIds;
  final List<String> categoryIds;
  final List<String> menuIds;
  final List<String> preferenceIds;

  @override
  List<Object?> get props => [
        name,
        address,
        code,
        phone,
        openingTime,
        closingTime,
        image,
        cuisineIds,
        categoryIds,
        preferenceIds,
        menuIds,
        errorMessage,
        status,
        isValid
      ];

  RegisterState copyWith({
    NotEmptyString? name,
    NotEmptyString? address,
    NotEmptyString? code,
    Phone? phone,
    NotEmptyString? openingTime,
    NotEmptyString? closingTime,
    FormzSubmissionStatus? status,
    File? image,
    String? errorMessage,
    bool? isValid,
    List<String>? cuisineIds,
    List<String>? categoryIds,
    List<String>? menuIds,
    List<String>? preferenceIds,
  }) {
    return RegisterState(
      name: name ?? this.name,
      address: address ?? this.address,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      status: status ?? this.status,
      image: image ?? this.image,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      cuisineIds: cuisineIds ?? this.cuisineIds,
      categoryIds: categoryIds ?? this.categoryIds,
      menuIds: menuIds ?? this.menuIds,
      preferenceIds: preferenceIds ?? this.preferenceIds,
    );
  }
}
