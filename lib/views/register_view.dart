import 'package:flutter/material.dart';
import 'package:simple_notes_app/konstant.dart';
import 'package:simple_notes_app/widgets/reusable_textfield.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Register",
          style: Konstant.titleTextTheme.copyWith(
            fontSize: 22,
          ),
        ),
        emailField(),
        passwordField(),
        confirmPasswordField(),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.login),
          label: Text("Register"),
        ),
      ],
    );
  }
}
