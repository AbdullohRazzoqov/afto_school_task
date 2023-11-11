part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}




class IsRegisterEvent extends RegisterEvent {}

class ChangeInputRegister extends RegisterEvent {
  String? email;
  String? password;
  String? rePassword;
  String? name;
  ChangeInputRegister({
    this.email,
    this.password,
    this.rePassword,
    this.name,
  });
}
