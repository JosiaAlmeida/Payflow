import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/shared/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  // var isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!; // Nao pode ser chamada sem authenticacao

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      // isAuthenticated = true;
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // isAuthenticated = false;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  //Salvando dados do usuario
  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  //Pegando dados do usuario
  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3)); // Adicionando delay
    //Pegando os dados
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;

      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
      return;
    }
  }
}
