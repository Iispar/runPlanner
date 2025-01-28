import 'package:flutter/material.dart';
import 'core/widgets/navigation_menu.dart';
import 'data/themes/theme.dart';
import 'data/themes/util.dart';
import 'features/all/all_plans_screen.dart';
import 'features/home/home_screen.dart';
import 'features/active/active_plan_screen.dart';
import 'package:get/get.dart';

void main() {
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
        GetPage(name: "/home", page: () => Wrapper(widget: Home())),
        GetPage(name: "/active", page: () => Wrapper(widget: ActivePlan())),
        GetPage(name: "/all", page: () => Wrapper(widget: AllPlans())),
      ],
      defaultTransition: Transition.noTransition,
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
    required this.widget
  });

  final Widget widget;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.widget,
      endDrawer: NavigationMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
      )
    );
  }
}
