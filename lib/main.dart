import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/high_fidelity_detail_item_screen.dart';
import 'screens/order_screen.dart';
import 'screens/delivery_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/high_fidelity_detail_item',
      builder: (BuildContext context, GoRouterState state) {
        return const HighFidelityDetailItemScreen();
      },
    ),
    GoRoute(
      path: '/order',
      builder: (BuildContext context, GoRouterState state) {
        return const OrderScreen();
      },
    ),
    GoRoute(
      path: '/delivery',
      builder: (BuildContext context, GoRouterState state) {
        return const DeliveryScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Coffee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
