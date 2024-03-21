import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_auth_example/auth_bloc/bloc/auth_event.dart';
import 'package:flutter_bloc_auth_example/auth_bloc/bloc/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthSuccess(name: 'Rizqi'));
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthInitial());
      },
    );
  }
}
