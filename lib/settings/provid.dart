import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Chatting {
  String nama;
  List<Map<String, String>> daftarChat;

  Chatting({
    required this.nama,
    required this.daftarChat,
  });
}

class ChatProvider extends ChangeNotifier {
  Map<String, Chatting> listPercakapan = {
    "abc123": Chatting(nama: "Customer Service", daftarChat: [
      {"Chat Centre": "Hi, Selamat datang di Money Manage!"},
      {"Me": "Hi juga"},
      {"Chat Centre": "Dengan Chat Center, kami akan melayani anda juga membantu menyelesaikan kendala yang anda hadapi!"},
    ])
  };

  void addChat(chat, String chatKey) {
    listPercakapan[chatKey]!.daftarChat.add(chat);
    notifyListeners();
  }
}

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  int _groupButton = 0;

  Locale get locale => _locale;
  int get groupButton => _groupButton;
  void changeLocale(Locale locale) {
    _locale = locale;

    _groupButton = locale.languageCode == 'id' ?  1 : 0;
    notifyListeners();
  }
}

class NotifProvider extends ChangeNotifier {
  bool isNotif = false;

  void changeMode() {
    isNotif = !isNotif;
    notifyListeners();
  }
}

class FontSizeProvider with ChangeNotifier {
  double _sliderValue = 50;

  double get sliderValue => _sliderValue;

  double get fontSize => _sliderValue / 50 * 14;

  void setSliderValue(double newValue) {
    _sliderValue = newValue;
    notifyListeners();
  }
}

class PasswordVisibilityProvider with ChangeNotifier {
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void toggleVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}