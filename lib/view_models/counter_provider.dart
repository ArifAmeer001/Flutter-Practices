import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;
  int getCount() => _count;

  void incrementCount(){
    _count++;
    print("Increment called");
    notifyListeners();
  }

  void decrementCount(){
    _count--;
    print("Decrement called");
    notifyListeners();
  }
}