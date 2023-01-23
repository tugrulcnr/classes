import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/view_model/password_view_model.dart';
import 'package:flutter_unicornova_panel/auth/login/view/login_view.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/services/password_service.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatelessWidget {
  late String data;
  TextEditingController _controllerParola = TextEditingController();
  TextEditingController _controllerValidate = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final verificateViewModel =Provider.of<VericateViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
             TextField(
              controller: _controllerParola,
              onChanged: (value){verificateViewModel.password = value;},
              decoration: InputDecoration(labelText: "New Password"),
              obscureText: true,
            ),
             TextField(
              controller: _controllerValidate,
              onChanged: (value){verificateViewModel.passwordValidate = value;},
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),

            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                //String enteredText = _controllerr.text;
                verificateViewModel.password = _controllerParola.text;
                verificateViewModel.passwordValidate = _controllerValidate.text;
                verificateViewModel.checkItAndIncrease(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
