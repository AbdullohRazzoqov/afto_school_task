// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState extends Equatable {
  bool isRegister;
  StateStatus stateStatus = StateStatus.normal;
  ValidateError? error;
  RegisterState(
      {this.stateStatus = StateStatus.normal,
      this.isRegister = true,
      this.error});
  RegisterState copyWith({
    StateStatus? stateStatus,
    bool? isRegister,
    ValidateError? error,
  }) {
    return RegisterState(
        stateStatus: stateStatus ?? this.stateStatus,
        isRegister: isRegister ?? this.isRegister,
        error: error);
  }

  @override
  List<Object?> get props => [stateStatus, isRegister, error];
}

final class RegisterInitial extends RegisterState {}

class ValidateError {
  bool nameError;
  bool emailError;
  bool passwordError;
  bool rePassowrdError;
  ValidateError({
    this.nameError = false,
    this.emailError = false,
    this.passwordError = false,
    this.rePassowrdError = false,
  });
}
