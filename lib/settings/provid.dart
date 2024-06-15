import 'package:flutter/material.dart';

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
    "abc123": Chatting(nama: "Chat Centre", daftarChat: [
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
  int groupButton = 0;
  void ChangeVal(int val) {
    groupButton = val;
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