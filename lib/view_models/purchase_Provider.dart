import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider_w_routes/models/purchase_model.dart';
import 'package:provider_w_routes/services/hive_boxes/hive_boxes.dart';

class PurchaseProvider extends ChangeNotifier{

  late Box<PurchaseModel> _purchaseBox;
  PurchaseModel? _purchase;

  PurchaseProvider(){
    _openBox();
  }

  Future<void> _openBox()async {
    _purchaseBox = HiveBoxes.getPurchaseBox();
    _loadPurchase();
    notifyListeners();
  }

  PurchaseModel? get purchased => _purchase;

  Future<void> _loadPurchase() async{
    if(_purchaseBox.isNotEmpty){
      _purchase = _purchaseBox.getAt(0);
    }else{
      return _purchase = null;
    }
    notifyListeners();
  }

  Future<void> savePurchase(PurchaseModel purchase) async{
    if(_purchaseBox.isNotEmpty){
      await _purchaseBox.put(0, purchase);
    }else{
      _purchaseBox.add(purchase);
    }
    _purchase = purchase;
    notifyListeners();
  }

  Future<void> deletePurchase() async{
    if(_purchaseBox.isNotEmpty) {
      await _purchaseBox.deleteAt(0);
      _purchase = null;
      notifyListeners();
    }
  }

  bool isSubscriptionActive(){
    if(_purchase == null){
      return false;
    }
    return _purchase!.expiryDate.isAfter(DateTime.now());
  }
}