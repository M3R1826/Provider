import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String defaultText = "元テキスト";

  void changeText() {
    defaultText = "新規テキストです";
    notifyListeners();
  }
}
