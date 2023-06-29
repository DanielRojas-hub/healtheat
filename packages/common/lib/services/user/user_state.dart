part of 'user_bloc.dart';

enum UserStatus {
  success,
  loading,
  failure,
}

class UserState extends Equatable {
  const UserState._({
    required this.status,
    this.user = User.empty,
  });

  final UserStatus status;
  final User user;

  const UserState.success(User user)
      : this._(
          status: UserStatus.success,
          user: user,
        );

  const UserState.loading() : this._(status: UserStatus.loading);

  const UserState.failure() : this._(status: UserStatus.failure);

  @override
  List<Object> get props => [status, user];
}
