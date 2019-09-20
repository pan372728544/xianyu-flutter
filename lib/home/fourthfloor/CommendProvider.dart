import 'package:flutter/material.dart';
import '../../config/HttpMethod.dart';

class CommendProvider with ChangeNotifier {

  int _value;

  int get value => _value;

  CommendProvider(this._value);

  void increment(newvalue){
    _value = newvalue;
    notifyListeners();
  }
 

}