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

final GoRouter router = GoRouter(
  initialLocation: '/splash_screen', //TODO в константы
  routes: <RouteBase>[
    GoRoute(
      path: '/splash_screen', //TODO в константы
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: '/auth_screen', //TODO в константы
      builder: (BuildContext context, GoRouterState state) =>
          const AuthScreen(),
    ),
    GoRoute(path: '/cashbox_screen',
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
              path: '/cashier_screen', //TODO в константы
              builder: (BuildContext context, GoRouterState state) =>
                  const CashierScreen(),
              routes: <RouteBase>[
                // GoRoute(
                //   path: 'cashbox_screen', //TODO в константы
                //   builder: (BuildContext context, GoRouterState state) =>
                //       const CashboxScreen(),
                // )
              ],
            )
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/inventory_screen', //TODO в константы
              builder: (BuildContext context, GoRouterState state) =>
                  const InventoryScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          //reports
          routes: <RouteBase>[
            GoRoute(
              path: '/reports_screen', //TODO в константы
              builder: (BuildContext context, GoRouterState state) =>
                  const ReportsScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          //settings
          routes: <RouteBase>[
            GoRoute(
              path: '/settings_screen', //TODO в константы
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsScreen(),
            )
          ],
        ),
      ],
    ),
  ],
);
