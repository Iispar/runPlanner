import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/features/create/create_screen.dart';
import 'package:run_planner/hive_registrar.g.dart';

import 'core/widgets/Responsive_widget.dart';
import 'core/widgets/navigation_menu.dart';
import 'data/themes/theme.dart';
import 'data/themes/util.dart';
import 'features/all/all_plans_screen.dart';
import 'features/home/home_screen.dart';
import 'features/plan/plan_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapters();

  await Hive.openBox("storage");

  Get.lazyPut<PlanController>(() => PlanController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Open Sans", "Open Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    return GetMaterialApp(
      initialRoute: "/home",
      theme: brightness == Brightness.light ? theme.light() : theme.light(),
      getPages: [
        GetPage(
            name: "/home", page: () => ScrollableWrapper(widget: HomeScreen(), showNav: true,)),
        GetPage(
            name: "/plan/id/:id", page: () => Wrapper(widget: PlanScreen())),
        GetPage(name: "/all", page: () => Wrapper(widget: AllPlans())),
        GetPage(
            name: "/create", page: () => ScrollableWrapper(widget: Create(), showNav: false,)),
      ],
      defaultTransition: Transition.noTransition,
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(child: SizedBox(width: 960, child: widget.widget))),
        endDrawer: ResponsiveWidget(
            mobile: NavigationMenu(), desktop: Drawer(child: NavigationMenu())),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ));
  }
}

class ScrollableWrapper extends StatefulWidget {
  const ScrollableWrapper(
      {super.key, required this.widget, required this.showNav});

  final bool showNav;
  final Widget widget;

  @override
  State<ScrollableWrapper> createState() => _ScrollableWrapperState();
}

class _ScrollableWrapperState extends State<ScrollableWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child:
                    Center(child: SizedBox(width: 960, child: widget.widget)))),
        endDrawer: widget.showNav == true
            ? ResponsiveWidget(
                mobile: NavigationMenu(),
                desktop: Drawer(child: NavigationMenu()))
            : null,
        appBar: widget.showNav == true
            ? AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
              )
            : AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
              ));
  }
}
