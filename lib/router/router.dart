import 'package:api_study/screens/auth_screen.dart';
import 'package:api_study/screens/cashbox_screen.dart';
import 'package:api_study/screens/cashier_screen.dart';
import 'package:api_study/screens/inventory_screen.dart';
import 'package:api_study/screens/menu_screen.dart';
import 'package:api_study/screens/reports_screen.dart';
import 'package:api_study/screens/settings_screen.dart';
import 'package:api_study/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes{
  SplashScreen('/splash_screen'),
  AuthScreen('/auth_screen'),
  CashBoxScreen('/cashbox_screen'),
  CashierScreen('/cashier_screen'),
  InventoryScreen('/inventory_screen'),
  ReportsScreen('/reports_screen'),
  SettingsScreen('/settings_screen');

  final String path;
  const AppRoutes(this.path);

}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.SplashScreen.path,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.SplashScreen.path,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.AuthScreen.path,
      builder: (BuildContext context, GoRouterState state) =>
          const AuthScreen(),
    ),
    GoRoute(path: AppRoutes.CashBoxScreen.path,
      builder: (BuildContext context, GoRouterState state) =>
      const CashboxScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) =>
          MenuScreen(child: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.CashierScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const CashierScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.InventoryScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const InventoryScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          //reports
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.ReportsScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const ReportsScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          //settings
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.SettingsScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsScreen(),
            )
          ],
        ),
      ],
    ),
  ],
);
