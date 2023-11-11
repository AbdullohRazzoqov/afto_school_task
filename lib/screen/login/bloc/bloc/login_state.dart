part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isRegister;
  final bool emailError;
  final bool passwordError;
  StateStatus stateStatus = StateStatus.normal;

  LoginState(
      {this.stateStatus = StateStatus.normal,
      this.isRegister = true,
      this.emailError = false,
      this.passwordError = false});
  LoginState copyWith({
    StateStatus? stateStatus,
    bool? isRegister,
    bool passwordError = false,
    bool emailError = false,
  }) {
    return LoginState(
      stateStatus: stateStatus ?? this.stateStatus,
      isRegister: isRegister ?? this.isRegister,
      passwordError: passwordError,
      emailError: emailError,
    );
  }

  @override
  List<Object?> get props => [stateStatus, isRegister];
}

final class LoginInitial extends LoginState {}

enum StateStatus {
  normal,
  success,
  error,
  active,
  notActive,
}
