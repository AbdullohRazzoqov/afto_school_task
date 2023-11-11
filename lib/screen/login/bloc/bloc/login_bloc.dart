import 'package:afto_school_task/core/helpers/app_text.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isRegister = true;
  bool emailError = false, passwordError = false;
  String emailInput = '', passwordInput = '';
  LoginBloc() : super(LoginInitial()) {
    on<ChangeInput>((event, emit) {
      if (event.email != null) {
        emailInput = event.email!;
      }
      if (event.password != null) {
        passwordInput = event.password!;
      }
      if (emailInput.isEmpty || passwordInput.isEmpty) {
        emit(state.copyWith(stateStatus: StateStatus.notActive));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.active));
      }
    });
    on<IsLoginEvent>((event, emit) {
      loginValidate(email: emailInput, password: passwordInput);
      if (emailError || passwordError) {
        emit(state.copyWith(stateStatus: StateStatus.error));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.success));
      }
    });
    on<ChangePageEvent>((event, emit) {
      if (event.pageIndex == 0) {
        isRegister = true;
      } else {
        isRegister = false;
      }
      emit(state.copyWith(isRegister: isRegister));
    });
  }

  void loginValidate({required String email, required String password}) {
    if (AppText.password != password) {
      passwordError = true;

      if (AppText.email != email) {
        passwordError =true;
      }
    }
  }
}
