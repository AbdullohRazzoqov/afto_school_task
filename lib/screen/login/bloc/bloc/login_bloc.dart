import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isRegister = true;
  LoginBloc()
      : super(
          LoginInitial(),
        ) {
    on<IsLoginEvent>((event, emit) {
      bool response = ValidateError()
          .loginValidate(email: event.email, password: event.password);
      if (response) {
       emit(state.copyWith(stateStatus: StateStatus.success));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.error));
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
}

class ValidateError {
  String email = 'testuchun@gmail.com';
  String password = '12345';
  bool loginValidate({required String email, required String password}) {
    if (this.email == email && this.password == password) {
      return true;
    } else {
      return false;
    }
  }
}
