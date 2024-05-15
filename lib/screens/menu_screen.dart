import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: child.currentIndex,
        onDestinationSelected: (int index){
          child.goBranch(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'Cashier'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Invenory'),
          NavigationDestination(icon: Icon(Icons.receipt_long_rounded), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],),
    );
  }
}
