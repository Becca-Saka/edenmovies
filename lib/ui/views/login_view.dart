import 'package:edenmovies/app/barrel.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationController authController =
        locator<AuthenticationController>();

    return Scaffold(body: SafeArea(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  color: Colors.black,
                                )),
                            const Text('glad to see you!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                            const SizedBox(height: 30),
                            AppInput(
                              initialValue: authController.email,
                              onChanged: authController.updateEmail,
                              labelText: 'Email',
                              color: Colors.black,
                            ),
                            const SizedBox(height: 30),
                            AppInput(
                              initialValue: authController.password,
                              onChanged: authController.updatePassword,
                              labelText: 'Password',
                              color: Colors.black,
                            ),
                            const SizedBox(height: 30),
                            AuthButton(
                              height: 60,
                              hasRadius: true,
                              text: 'LOGIN',
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  authController.login();
                                }
                              },
                              color: appColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    AuthButton(
                      height: 80,
                      text: 'Create Account',
                      onPressed: authController.gotoSignUp,
                      color: appColor,
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
