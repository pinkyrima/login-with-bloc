import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/feature/auth/bloc/auth_bloc.dart';
import 'package:login_bloc/feature/auth/widget/login_screen.dart';
import 'package:login_bloc/feature/dashboarc/widget/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (BuildContext context) {
            return AuthBloc();
          },
          child: const LogInScreen()),
    );
  }
}
