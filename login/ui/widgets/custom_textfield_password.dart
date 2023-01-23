// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_unicornova_panel/auth/login/view_model/login_view_model.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  RegisterViewModel registerViewModel;

  CustomTextFormFieldPassword({
    required this.controller,
    required this.hintText,
    required this.registerViewModel,
  });
  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewModel;
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        widget.registerViewModel.password=value;
        debugPrint("şifre : $value");
        debugPrint("şifre : ${widget.registerViewModel.password}");
      },
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        labelText: 'Parola',
        hintText: widget.hintText,
        // Here is key idea
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
