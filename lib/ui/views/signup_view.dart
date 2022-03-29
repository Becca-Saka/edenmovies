import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:edenmovies/ui/widgets/app_input.dart';
import 'package:edenmovies/ui/widgets/auth_button.dart';
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
              child: SingleChildScrollView(
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
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    const SizedBox(height: 30),
                    AppInput(
                      initialValue: authController.name,
                      onChanged: authController.updateName,
                      labelText: 'Username',
                    ),
                    const SizedBox(height: 30),
                    AppInput(
                      initialValue: authController.email,
                      onChanged: authController.updateEmail,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 30),
                    AppInput(
                      initialValue: authController.password,
                      onChanged: authController.updatePassword,
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 30),
                    AuthButton(
                      height: 60,
                      hasRadius: true,
                      text: 'CREATE ACCOUNT',
                      onPressed: authController.signUp,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            AuthButton(
              height: 80,
              text: 'Login',
              onPressed: authController.gotoLogin,
            )
          ],
        ),
      ),
    );
  }
}


