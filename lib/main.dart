import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_text/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_text/blocs/authentication/authentication_event.dart';
import 'package:flutter_text/blocs/authentication/authentication_state.dart';
import 'package:flutter_text/repositories/firebase_authentication_repository.dart';
import 'package:flutter_text/screens/event_list_screen.dart';
import 'package:flutter_text/screens/sign_in_screen.dart';
import 'package:flutter_text/screens/splash_screen.dart';

void main() {
  final authenticationrepository = FirebaseAuthenticationRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) => 
        AuthenticationBloc(authRepository: authenticationrepository)
          ..dispatch(AppStarted()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Awase',
      theme: ThemeData(
         primaryColor: Colors.indigo[900],
         accentColor: Colors.pink[800],
         brightness: Brightness.light),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        builder: (context, state) {
          if (state is AuthenticationInProgress) {
            return SplashScreen();
          }
          if (state is AuthenticationSuccess) {
            return EventListScreen();
          }
          if (state is AuthenticationFailure) {
            return SignInScreen();
          }
          return Container();
        }),
  );
  }
}

