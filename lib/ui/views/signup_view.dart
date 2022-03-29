import 'package:edenmovies/app/barrel.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationController authController =
        locator<AuthenticationController>();

    return Scaffold(
        backgroundColor: appColor1,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
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
                                Center(
                                  child: AuthButton(
                                    height: 60,
                                    hasRadius: true,
                                    text: 'CREATE ACCOUNT',
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        authController.signUp();
                                      }
                                    },
                                  ),
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
                ),
              );
            },
          ),
        ));
  }
}
