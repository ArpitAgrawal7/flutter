import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void changeObSecureEvent(bool obSecure) {
   /* if (obSecure == true) {
      emit(ChangeState(false));
    } else {
      emit(ChangeState(true));
    }*/
    emit(ChangeState(!obSecure));
  }
}
