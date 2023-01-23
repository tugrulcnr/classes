import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/login/ui/widgets/login_widgets/email.dart';
import 'package:flutter_unicornova_panel/auth/login/ui/widgets/login_widgets/password.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/view/NewPasswordScreen.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/view/getSMS.dart';
import 'package:provider/provider.dart';
import '../view_model/login_view_model.dart';
import 'package:flutter_unicornova_panel/auth/login/ui/widgets/login_widgets/phone.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isPhoneTextFieldVisible = false;
  bool _isEMailTextFieldVisible = true;
  String _selectedButton = 'email';
  bool isChecked = false;



  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        //  shadowColor: Colors.white,
        actions: const [
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Butonları gösteren kısım
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Email butonu

                    TextButton(
                      child: Text('Email'),
                      onPressed: () {
                        // Seçilen buton değişkenini güncelle
                        setState(() {
                          registerViewModel.isMailSelacted = true;
                          _isEMailTextFieldVisible = true;
                          _isPhoneTextFieldVisible = false;
                          _selectedButton = 'email';
                        });
                      },
                    ),
// Phone Number butonu
                    TextButton(
                      child: Text('Phone Number'),
                      onPressed: () {
// Seçilen buton değişkenini güncelle
                        setState(() {
                          registerViewModel.isMailSelacted = false;
                          _isEMailTextFieldVisible = false;
                          _isPhoneTextFieldVisible = true;
                          _selectedButton = 'phone_number';
                        });
                      },
                    ),
                  ],
                ),
                Center(
                    child: Visibility(
                  visible: _isPhoneTextFieldVisible,
                  child: PhoneWidget(
                    registerViewmodel: registerViewModel,
                  ),
                )),
                Center(
                  child: Visibility(
                    visible: _isEMailTextFieldVisible,
                    child: EmailWidget(
                      registerViewModel: registerViewModel,
                    ),
                  ),
                  //getRegisterWidget(registerViewModel),
                ),
                Center(
                  child: PasswordWidget(
                    registerViewModel: registerViewModel,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text("Oturum Aç"),
                  onPressed: () {
                    // Oturum açma işlemleri burada yer alacak
                    registerViewModel.checkItAndIncrease(context);
                  },
                ),

                ElevatedButton(
                  child: Text("Şifremi Unuttum"),

                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => getSMS(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
