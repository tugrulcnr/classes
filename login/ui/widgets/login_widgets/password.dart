// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_unicornova_panel/auth/login/view_model/login_view_model.dart';
import 'package:flutter_unicornova_panel/auth/login/ui/widgets/custom_textfield_password.dart';

class PasswordWidget extends StatefulWidget {
  RegisterViewModel registerViewModel;
  PasswordWidget({
    Key? key,
    required this.registerViewModel,
  }) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewModel;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextFormFieldPassword(
                registerViewModel: registerViewModel,
                controller: passwordController,
                hintText: "Parola giriniz"),
          ],
        ),
      ),
    );
  }
}
