import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_w_routes/models/purchase_model.dart';
import 'package:provider_w_routes/view_models/purchase_Provider.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Purchase Screen'),
        ),
        body: Consumer<PurchaseProvider>(builder: (ctx, purchaseProvider, _) {
          return Column(
            children: [
              Text(
                  'Status ${ctx.watch<PurchaseProvider>().purchased?.status ?? 'InActive'}'),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Purchase Date: ${ctx.watch<PurchaseProvider>().purchased?.purchaseDate ?? 'Null'}'),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Expiry Date: ${ctx.watch<PurchaseProvider>().purchased?.expiryDate ?? 'Null'}'),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Row(
                children: [
                  IconButton(
                      onPressed: () => ctx
                          .read<PurchaseProvider>()
                          .savePurchase(PurchaseModel(
                              status: 'Active',
                              purchaseDate: DateTime.now(),
                              expiryDate: DateTime.now()
                                  .add(const Duration(minutes: 5)))),
                      icon: const Icon(Icons.add)),
                  IconButton(
                      onPressed: () =>
                          ctx.read<PurchaseProvider>().deletePurchase(),
                      icon: const Icon(Icons.remove))
                ],
              ))
            ],
          );
        }));
  }
}
