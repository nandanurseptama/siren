import 'package:flutter/material.dart';

typedef NavigationMenuItem = ({String label, IconData icon});
typedef NavigationMenuBuilder = Widget Function(
    BuildContext context, int selectedMenuIndex, ValueChanged<int> onNavigate);

class NavigationScreen extends StatefulWidget {
  static String routeName = "/";
  final List<NavigationMenuBuilder> builders;
  final List<NavigationMenuItem> items;
  const NavigationScreen(
      {super.key, required this.builders, required this.items});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final ValueNotifier<int> _selectedMenuIndexController = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _selectedMenuIndexController,
        builder: (context, index, _) {
          return Scaffold(
            bottomNavigationBar: _bottomNavigationBar(index),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return IndexedStack(
                    index: index,
                    children: List.generate(widget.builders.length, (index) {
                      return widget.builders[index].call(context, index, _onTapSubMenu);
                    }),
                  );
                },
              ),
            ),
          );
        });
  }

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTapSubMenu,
      items: widget.items.map((e) {
        return BottomNavigationBarItem(icon: Icon(e.icon), label: e.label);
      }).toList(),
    );
  }

  void _onTapSubMenu(int index) {
    setState(() {
      _selectedMenuIndexController.value = index;
    });
    return;
  }
}
