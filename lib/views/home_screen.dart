import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_w_routes/view_models/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(builder: (ctx, counterProvider, _){
              return Text('${ctx.watch<CounterProvider>().getCount()}');
            }),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: ()=> context.push('/counter'), child: const Text("Counter Screen")),
            const SizedBox(height: 10,),
            const Text("List View: "),
            ElevatedButton(onPressed: ()=> context.push('/listScreen'), child: const Text("List Screen")),
          ],
        ),
      ),
    );
  }
}
