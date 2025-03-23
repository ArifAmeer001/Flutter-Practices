import 'package:hive/hive.dart';
import 'package:provider_w_routes/models/purchase_model.dart';

class HiveBoxes{
  static Box<PurchaseModel> getPurchaseBox() => Hive.box<PurchaseModel>('subscribe');
}