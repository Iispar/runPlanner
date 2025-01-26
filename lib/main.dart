import 'package:flutter/material.dart';
import 'features/all/all_plans_screen.dart';
import 'features/home/home_screen.dart';
import 'features/starred/starred_plan_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => Wrapper(initialIndex: 0)),
        GetPage(name: "/starred", page: () => Wrapper(initialIndex: 1)),
        GetPage(name: "/all", page: () => Wrapper(initialIndex: 2)),
      ],
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<String> routes = ['/home', '/starred', '/all'];
  final List<Widget> pages = [
    Home(),
    StarredPlan(),
    AllPlans(),
  ];
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex.clamp(0, pages.length - 1); // Safe bounds
  }

  void changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
      Get.offAllNamed(routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          changePage(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.star), label: 'Starred'),
          NavigationDestination(icon: Icon(Icons.list), label: 'All'),
        ],
      ),
    );
  }
}
