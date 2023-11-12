import 'package:afto_school_task/screen/login/bloc/bloc/login_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool isRegister = true;
  bool emailError = false,
      passwordError = false,
      nameError = false,
      rePasswordError = false;
  String emailInput = '',
      passwordInput = '',
      nameInput = '',
      rePasswordInput = '';
  RegisterBloc() : super(RegisterInitial()) {
    on<ChangeInputRegister>((event, emit) {
      if (event.email != null) {
        emailInput = event.email!;
      }
      if (event.password != null) {
        passwordInput = event.password!;
      }
      if (event.rePassword != null) {
        rePasswordInput = event.rePassword!;
      }
      if (event.name != null) {
        nameInput = event.name!;
      }
      if (emailInput.isEmpty ||
          passwordInput.isEmpty ||
          rePasswordInput.isEmpty ||
          nameInput.isEmpty) {
        emit(state.copyWith(stateStatus: StateStatus.notActive));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.active));
      }
    });
    on<IsRegisterEvent>((event, emit) {
      registerValidate(
          email: emailInput,
          password: passwordInput,
          rePasswoord: rePasswordInput,
          name: nameInput);
      if (emailError || passwordError || nameError || rePasswordError) {
        emit(state.copyWith(
          stateStatus: StateStatus.error,
          error: ValidateError(
            emailError: emailError,
            passwordError: passwordError,
            rePassowrdError: rePasswordError,
            nameError: nameError,
          ),
        ));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.success));
      }
    });
  }
  void registerValidate({
    required String email,
    required String password,
    required String rePasswoord,
    required String name,
  }) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (name.length > 12 || name.length < 3) {
      nameError = true;
    } else {
      nameError = false;
    }
    if (!emailValid) {
      emailError = true;
    } else {
      emailError = false;
    }
    if (password.length < 7 || rePasswoord.length < 7) {
      passwordError = true;
      rePasswordError = true;
    } else if (password != rePasswoord) {
      passwordError = false;
      rePasswordError = true;
    } else {
      passwordError = false;
      rePasswordError = false;
    }
  }
}
