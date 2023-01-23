import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  // Web servis adresi
  static const String _url = 'https://example.com/login';

  // Kullanıcı adı ve şifre bilgilerini kontrol etmek için web servis çağrısı yapar
  static Future<bool> login(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse(_url),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      // Eğer web servis 200 OK durum kodunu döndürürse
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        // Eğer kullanıcı bilgileri doğruysa
        if (jsonData['success']) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
