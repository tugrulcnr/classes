import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _isPhoneTextFieldVisible = true;
  bool _isEMailTextFieldVisible = false;
  bool isChecked = false;

  // Hangi butona tıklandığını tutacak olan değişken
  String _selectedButton = 'email';

  // Text field'ları göstermek için kullanılacak animasyon controller'ı
  late AnimationController _animationController;

  // Text field'ları göstermek için kullanılacak animasyon değişkenleri
  late Animation<double> _emailFieldAnimation;
  late Animation<double> _phoneNumberFieldAnimation;

  @override
  void initState() {
    super.initState();

    // Animasyon controller'ını oluştur
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // Animasyon değişkenlerini oluştur
    _emailFieldAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _phoneNumberFieldAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Text field'ların gösterileceği durumda animasyon controller'ını çalıştır
    _animationController.forward();
  }

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


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    _isEMailTextFieldVisible = true;
                    _isPhoneTextFieldVisible = false;
                    _selectedButton = 'email';
                  });
                  // Animasyon controller'ını yeniden çalıştır
                  _animationController.reset();
                  _animationController.forward();
                },
              ),
// Phone Number butonu
              TextButton(
                child: Text('Phone Number'),
                onPressed: () {
// Seçilen buton değişkenini güncelle
                  setState(() {
                    _isEMailTextFieldVisible = false;
                    _isPhoneTextFieldVisible = true;
                    _selectedButton = 'phone_number';
                  });
// Animasyon controller'ını yeniden çalıştır
                  _animationController.reset();
                  _animationController.forward();
                },
              ),
            ],
          ),
// Text field'ları gösteren kısım
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
// Email text field'ı
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FadeTransition(
                      opacity: _emailFieldAnimation,
                      child: Visibility(
                        visible: _isEMailTextFieldVisible,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),
// Phone Number text field'ı
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FadeTransition(
                      opacity: _phoneNumberFieldAnimation,
                      child: Visibility(
                        visible: _isPhoneTextFieldVisible,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FadeTransition(
                      opacity: _phoneNumberFieldAnimation,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  // Beni hatırla seçimi için checkbox

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


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
