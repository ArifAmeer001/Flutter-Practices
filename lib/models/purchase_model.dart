import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'purchase_model.g.dart';

@HiveType(typeId: 0)
class PurchaseModel extends HiveObject{
  @HiveField(0)
  final String status;
  @HiveField(1)
  final DateTime purchaseDate;
  @HiveField(2)
  final DateTime expiryDate;

PurchaseModel({required this.status, required this.purchaseDate, required this.expiryDate});
}