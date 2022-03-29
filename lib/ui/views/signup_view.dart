import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationController authController =
        Provider.of<AuthenticationController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColor1,
      body: SafeArea(
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  const Text('Welcome',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const Text('glad to see you!',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  AppInput(
                    initialValue: authController.name,
                    onChanged: authController.updateName,
                    labelText: 'Username',
                  ),
                  AppInput(
                    initialValue: authController.email,
                    onChanged: authController.updateEmail,
                    labelText: 'Email',
                  ),
                  AppInput(
                    initialValue: authController.password,
                    onChanged: authController.updatePassword,
                    labelText: 'Password',
                  ),
                  AuthButton(
              height: 70,
              text: 'Login',
              onPressed: authController.gotoLogin,
            ),
                  ElevatedButton(
                      onPressed: () => authController.signUp(),
                      child: const Text('Create Account')),
                  
                ],
              ),
            ),
            const Spacer(),
            AuthButton(
              height: 70,
              text: 'Login',
              onPressed: authController.gotoLogin,
            )
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final Color color;
  const AuthButton({
    Key? key,
    required this.height,
    required this.onPressed,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color),
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  color: color == Colors.white ? Colors.black : Colors.white,
                  fontSize: 16))),
    );
  }
}

class AppInput extends StatelessWidget {
  final String initialValue, labelText;
  final void Function(String) onChanged;
  const AppInput({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[500]),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }
}
