import 'package:flutter/material.dart';
import 'package:provider_w_routes/models/list_model.dart';

class ListProvider extends ChangeNotifier{
  // List<Map<String,dynamic>> _list = [];
List<ListModel> _list = [];
  // List<Map<String,dynamic>> getList() => _list;
List<ListModel> getList() => _list;
  // void addToList(Map<String,dynamic> item){
void addToList(ListModel item){
    _list.add(item);
    notifyListeners();
  }

  // void editList(Map<String,dynamic> item, int index){
void editList(ListModel item, int index){
    _list[index] = item;
    notifyListeners();
  }

  void removeFromList(int index){
    _list.removeAt(index);
    notifyListeners();
  }
}