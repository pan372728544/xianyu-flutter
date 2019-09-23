import 'package:flutter/material.dart';

class CommendProvider with ChangeNotifier {

  // 透明度
  double _value;

  double get value => _value;

  CommendProvider(this._value);

  void increment(newvalue){
    _value = newvalue;
    notifyListeners();
  }
 

}