import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';

class AuthController{
  var isAuthenticated = false;
  var _user;

  get user => _user; // Nao pode ser chamada sem authenticacao

  void setUser(BuildContext context,var user){
    if(user != null){
      isAuthenticated = true;
      _user = user;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else {
      isAuthenticated = false;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}