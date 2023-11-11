// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginEvent {}

class ChangePageEvent extends LoginEvent {
  int pageIndex;
  ChangePageEvent({
    required this.pageIndex,
  });
}

class IsLoginEvent extends LoginEvent {}


class ChangeInput extends LoginEvent {
  String? email;
  String? password;
  ChangeInput({
    this.email,
    this.password,
  });
}
