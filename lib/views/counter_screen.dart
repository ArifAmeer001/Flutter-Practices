import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_w_routes/view_models/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CounterProvider>(builder: (ctx, counterProvider, _) {
            return Text('${ctx.watch<CounterProvider>().getCount()}');
          }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () =>
                      context.read<CounterProvider>().incrementCount(),
                  // Provider.of<CounterProvider>(context, listen: false).incrementCount(),
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () =>
                      context.read<CounterProvider>().decrementCount(),
                  icon: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
