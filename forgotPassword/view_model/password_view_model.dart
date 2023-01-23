import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/services/password_service.dart';
import 'package:flutter_unicornova_panel/utils/utils.dart';

import 'package:flutter_unicornova_panel/auth/login/view/login_view.dart';

enum StatusCountries { initial, loading, finished }
enum StatusCities { initial, loading, finished }

class VericateViewModel with ChangeNotifier {
  VericateViewModel() {
    // getCountries();
  }


  String _password = "";
  String _passwordValidate = "";


  String get password => _password;
  String get passwordValidate => _passwordValidate;

  bool updated = false;



  set password(String password) => _password = password;
  set passwordValidate(String passwordValidate) => _passwordValidate = passwordValidate;



  void checkItAndIncrease(BuildContext context) {

        if (password.length >= 5 && passwordValidate.length >= 5) {
          if (password == passwordValidate) {
            showSnackBar(context, "Şifre Güncellendi.");

            updated = true;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterView()));

          } else {
            showSnackBar(context, "Parolaların aynı olduğundan emin olun.");
            updated = false;
          }
        } else {
          showSnackBar(context, "Parolanız en az 5 karakter olmalı");
          updated = false;
        }
        print(_password.length);
    }
}



