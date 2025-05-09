import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_w_routes/services/data_services/data_services.dart';
import 'package:provider_w_routes/view_models/counter_provider.dart';
import 'package:provider_w_routes/view_models/list_provider.dart';
import 'package:provider_w_routes/view_models/purchase_Provider.dart';
import 'package:provider_w_routes/views/counter_screen.dart';
import 'package:provider_w_routes/views/home_screen.dart';
import 'package:provider_w_routes/views/list_screen.dart';
import 'package:provider_w_routes/views/purchase_screen.dart';

void main() async{

  DataServices.initializeHive();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterProvider()),
      ChangeNotifierProvider(create: (_) => ListProvider()),
      ChangeNotifierProvider(create: (_) => PurchaseProvider()),
    ],
    child: const MyApp(),
  ));
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      name: '/home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state){
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: '/counter',
      path: '/counter',
      builder: (BuildContext context, GoRouterState state){
        return const CounterScreen();
      }
    ),
    GoRoute(
      name: '/listScreen',
      path: '/listScreen',
      builder: (BuildContext context, GoRouterState state){
        return const ListScreen();
      }
    ),
    GoRoute(
      name: '/purchase',
      path: '/purchase',
      builder: (BuildContext context, GoRouterState state){
        return const PurchaseScreen();
      }
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}