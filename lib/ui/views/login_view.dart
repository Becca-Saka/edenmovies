import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationController authController =
        Provider.of<AuthenticationController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Text('Welcome',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  )),
              const Text('glad to see you!',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  )),
              TextFormField(
                initialValue: authController.email,
                onChanged: authController.updateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                initialValue: authController.password,
                onChanged: authController.updatePassword,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                  onPressed: authController.login,
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: authController.gotoSignUp,
                  child: const Text('Create Account')),
            ],
          ),
        ),
      ),
    );
  }
}
