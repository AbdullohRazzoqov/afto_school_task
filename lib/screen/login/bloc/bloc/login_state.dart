part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool isRegister;
  StateStatus stateStatus = StateStatus.normal;
  LoginState({this.stateStatus = StateStatus.normal, this.isRegister = true});
  LoginState copyWith({
    StateStatus? stateStatus,
    bool? isRegister,
  }) {
    return LoginState(
      stateStatus: stateStatus ?? this.stateStatus,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  @override
  List<Object?> get props => [stateStatus, isRegister];
}

final class LoginInitial extends LoginState {}

enum StateStatus {
  normal,
  loading,
  loaded,
  success,
  error,
}
