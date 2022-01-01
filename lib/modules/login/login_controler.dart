import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/auth/user_model.dart';

class LoginController {
  final _authcontroller = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    ); //Verificando se esta conectando
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(name: response!.displayName!, photoURL: response.photoUrl);

      _authcontroller.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
