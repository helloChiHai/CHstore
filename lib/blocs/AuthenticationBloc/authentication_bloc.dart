import 'package:bloc/bloc.dart';

import 'package:chstore/blocs/AuthenticationBloc/authentication_event.dart';
import 'package:chstore/blocs/AuthenticationBloc/authentication_state.dart';
import 'package:chstore/models/UserModel.dart';
import 'package:chstore/repository/AuthService.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AutheService authenService = AutheService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<CreateUser>(
      (event, emit) async {
        emit(AuthenticationLoadingState(isLoading: true));
        try {
          final UserModel? user = await authenService.createUser(event.email,
              event.password, event.name, event.sdt, event.address);
          if (user != null) {
            emit(AuthenticationSuccessState(user));
          } else {
            emit(
              const AuthenticationFailureState(
                error: 'Tạo tài khoản thất bại',
              ),
            );
          }
        } catch (e) {
          print(e.toString());
        }
      },
    );

    on<SignIn>(
      (event, emit) async {
        emit(AuthenticationLoadingState(isLoading: true));
        try {
          final UserModel? user =
              await authenService.signInUser(event.email, event.password);

          if (user != null) {
            emit(AuthenticationSuccessState(user));
          } else {
            emit(const AuthenticationFailureState(
                error: 'Sai tài khoản hoặc mật khẩu'));
          }
        } catch (e) {
          print(e.toString());
          emit(const AuthenticationFailureState(
              error: 'Sai tài khoản hoặc mật khẩu'));
        }
      },
    );

    on<SignOut>(
      (event, emit) async {
        emit(AuthenticationLoadingState(isLoading: true));
        try {
          authenService.signOutUser();
        } catch (e) {
          print('eror: ${e.toString()}');
        }
      },
    );
  }
}
