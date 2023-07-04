part of 'payment_method_cubit.dart';

final class PaymentMethodState extends Equatable {
  final PaymentMethod paymentMethod;
  final FormzSubmissionStatus status;

  const PaymentMethodState(
      {this.paymentMethod = PaymentMethod.paypal,
      this.status = FormzSubmissionStatus.initial});

  PaymentMethodState copyWith({
    PaymentMethod? paymentMethod,
    FormzSubmissionStatus? status,
  }) {
    return PaymentMethodState(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [paymentMethod, status];
}
