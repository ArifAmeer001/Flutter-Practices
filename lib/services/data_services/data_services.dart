import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_w_routes/models/purchase_model.dart';

class DataServices{
  static Future<void> initializeHive() async{
    WidgetsFlutterBinding.ensureInitialized();
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    Hive.registerAdapter(PurchaseModelAdapter());
    await Hive.openBox<PurchaseModel>('subscribe');
    debugPrint("Hive Box has been opened");
  }
}