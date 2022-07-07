import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/feature/auth/bloc/auth_bloc.dart';
import 'package:login_bloc/feature/dashboarc/widget/dashboard_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: BlocConsumer<LoginBloc, AuthState>(
        listener: (BuildContext context, state) {
          if (state is AuthError) {
            buildErrorLayout();
          } else if (state is AuthLoaded) {
            clearTextData();
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const DashBoardScreen(),
              ),
            );
            // Navigator.of(context)
            //     .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is AuthLoading) {
            return buildInputField();
          } else {
            return buildInputField();
          }
        },
        //child: buildInputField(),
      ),
    );
  }

  Widget buildInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextField(
            controller: userName,
            decoration: const InputDecoration(hintText: 'username'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(hintText: 'password'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(Login(userName.text, password.text));
              },
              child: const Text('Login'))
        ],
      ),
    );
  }

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();
  }
}
