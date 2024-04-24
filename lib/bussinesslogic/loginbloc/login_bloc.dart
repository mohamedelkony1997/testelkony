
import 'package:bloc/bloc.dart';



import 'package:testelkony/bussinesslogic/loginbloc/login_event.dart';
import 'package:testelkony/bussinesslogic/loginbloc/login_state.dart';
import 'package:testelkony/repositery/Login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final error = await authRepository.signInWithEmailAndPassword(
          event.email, event.password);
      if (error == null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: error));
      }
    } catch (e) {
      emit(LoginFailure(error: 'An unexpected error occurred.'));
    }
  }
}
