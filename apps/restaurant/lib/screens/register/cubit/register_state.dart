part of 'register_cubit.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.errorMessage,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.name = const NotEmptyString.pure(),
    this.address = const NotEmptyString.pure(),
    this.code = const NotEmptyString.pure(),
    this.phone = const IsNumeric.pure(),
    this.openingTime = const NotEmptyString.pure(),
    this.closingTime = const NotEmptyString.pure(),
    List<String>? cuisineIds,
  }) : cuisineIds = cuisineIds ?? const [];
  final String? errorMessage;
  final FormzSubmissionStatus status;
  final bool isValid;
  final NotEmptyString name;
  final NotEmptyString address;
  final NotEmptyString code;
  final IsNumeric phone;
  final NotEmptyString openingTime;
  final NotEmptyString closingTime;
  final List<String> cuisineIds;

  @override
  List<Object?> get props => [
        name,
        address,
        code,
        phone,
        openingTime,
        closingTime,
        cuisineIds,
        errorMessage,
        status,
        isValid
      ];

  RegisterState copyWith({
    NotEmptyString? name,
    NotEmptyString? address,
    NotEmptyString? code,
    IsNumeric? phone,
    NotEmptyString? openingTime,
    NotEmptyString? closingTime,
    FormzSubmissionStatus? status,
    String? errorMessage,
    bool? isValid,
    List<String>? cuisineIds,
  }) {
    return RegisterState(
      name: name ?? this.name,
      address: address ?? this.address,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      cuisineIds: cuisineIds ?? this.cuisineIds,
    );
  }
}

// class RegisterInitial extends RegisterState {}
