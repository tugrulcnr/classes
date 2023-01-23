import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/view/NewPasswordScreen.dart';
import 'package:flutter_unicornova_panel/auth/forgotPassword/view_model/password_view_model.dart';

class getSMS extends StatefulWidget {
  const getSMS({Key? key}) : super(key: key);

  @override
  State<getSMS> createState() => _getSMSState();
}

class _getSMSState extends State<getSMS> {

  Future<bool> verifyUser(String email, String phone) async {
    // Doğrulama işlemleri burada yer alacak
    // Örnek olarak Firebase Auth kullanarak kullanıcının mail veya telefon numarasını doğrulamak
    // Eğer doğrulama başarılıysa true, başarısızsa false döndürün
    return true ;
  }

  bool _isPhoneTextFieldVisible2 = false;
  bool _isEMailTextFieldVisible2 = true;
  String _selectedButton2 = 'email';

  bool _isKod = false;
  String kodName = "Kod Al";

  @override
  Widget build(BuildContext context) {
    String email = "";
    String phone = "";
    bool verified = false;

    return Scaffold(
        appBar: AppBar(
          title: Text("Doğrulama"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Email butonu

                  TextButton(
                    child: Text('Email'),
                    onPressed: () {
                      // Seçilen buton değişkenini güncelle
                      setState(() {
                        _isKod = false;
                        _isEMailTextFieldVisible2 = true;
                        _isPhoneTextFieldVisible2 = false;
                        _selectedButton2 = 'email';
                      });
                    },
                  ),
// Phone Number butonu
                  TextButton(
                    child: Text('Phone Number'),
                    onPressed: () {
// Seçilen buton değişkenini güncelle
                      setState(() {
                        _isKod = false;
                        _isEMailTextFieldVisible2 = false;
                        _isPhoneTextFieldVisible2 = true;
                        _selectedButton2 = 'phone_number';
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _isEMailTextFieldVisible2,
                child: TextField(
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Visibility(
                visible: _isPhoneTextFieldVisible2,
                child: TextField(
                  decoration: InputDecoration(labelText: "Telefon"),
                  onChanged: (value) {
                    phone = value;
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(kodName),
                  onPressed: () {
                    setState(() {
                      _isKod = true;
                      kodName = "Yeniden Kod Al";
                    });

                  },
                ),
              ),
              Visibility(
                visible: _isKod,
                child: TextField(
                  decoration: InputDecoration(labelText: "Kodu yazınız.."),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("Doğrula"),
                      onPressed: () async {
                        verified = await verifyUser(email, phone);
                        if (verified) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPasswordScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                "Doğrulama başarısız, lütfen bilgilerinizi kontrol edin."),
                          ));
                        }
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
