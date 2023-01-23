import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/login/services/login_service.dart';
import 'package:flutter_unicornova_panel/utils/utils.dart';

enum StatusCountries { initial, loading, finished }

enum StatusCities { initial, loading, finished }

class RegisterViewModel with ChangeNotifier {
  String _emailAdress = "";
  String _password = "";
  String trueEmail = "ert@gmail.com";
  String truePassword = "123";

  String truephoneNumber = "+905398914541";
  String _phoneNumber = "";
  bool _validatedPhoneNumber = false;
  String _initialCountryCode = "TR";

  String get phoneNumber => _phoneNumber;
  bool get validatedPhoneNumber => _validatedPhoneNumber;
  String get initialCountryCode => _initialCountryCode;

  String get emailAdress => _emailAdress;
  String get password => _password;

  bool _isMailSelacted = true;

  bool get isMailSelacted => _isMailSelacted;

  set isMailSelacted(bool value) {
    _isMailSelacted = value;
  }

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  set validatedPhoneNumber(bool validatedPhoneNumber) =>
      _validatedPhoneNumber = validatedPhoneNumber;
  set initialCountryCode(String initialCountryCode) =>
      _initialCountryCode = initialCountryCode;
  set emailAdress(String emailAdress) => _emailAdress = emailAdress;
  set password(String password) => _password = password;

  void checkItAndIncrease(BuildContext context) {
    if(isMailSelacted){
      if (emailAdress == trueEmail) {
        if (password == truePassword) {
          showSnackBar(context, "Girdiniz.");
          debugPrint("email : $emailAdress");
          debugPrint("şifre : $password");
        } else {
          showSnackBar(context, "Parolanız Yanlış. Lütfen doğru Parola giriniz.");
        }
      } else {
        showSnackBar(context, "Email Yanlış. Lütfen doğru Email giriniz.");
      }
    }else{
      if (phoneNumber == truephoneNumber) {
        if (password == truePassword) {
          showSnackBar(context, "Girdiniz.");
          debugPrint("email : $phoneNumber");
          debugPrint("şifre : $password");
        } else {
          showSnackBar(context, "Parolanız Yanlış. Lütfen doğru Parola giriniz.");
        }
      } else {
        showSnackBar(context, "Lütfen geçerli bir telefon numarsı giriniz");
      }
    }



  }
}
