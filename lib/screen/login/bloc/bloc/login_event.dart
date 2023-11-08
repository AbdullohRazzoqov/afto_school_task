// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginEvent {}

class ChangePageEvent extends LoginEvent {
  int pageIndex;
  ChangePageEvent({
    required this.pageIndex,
  });
}

class IsLoginEvent extends LoginEvent {
  String email;
  String password;
  IsLoginEvent({
    required this.email,
    required this.password,
  });
}

class IsRegisterEvent extends LoginEvent {}
