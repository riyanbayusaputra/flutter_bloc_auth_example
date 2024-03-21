import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth_example/auth_bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc_auth_example/auth_bloc/bloc/auth_state.dart';
import 'package:flutter_bloc_auth_example/pages/home_page.dart';
import 'package:flutter_bloc_auth_example/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: "Flutter Login",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is AuthSuccess) {
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
