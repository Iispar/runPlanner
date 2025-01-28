import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Material(
              child: ListTile(
            title: Center(child: const Text('Home')),
            onTap: () {
              Get.toNamed("home");
            },
          )),
          Material(
              child: ListTile(
            title: Center(child: const Text('Active')),
            onTap: () {
              Get.toNamed("active");
            },
          )),
          Material(
              child: ListTile(
            title: Center(child: const Text('All')),
            onTap: () {
              Get.toNamed("all");
            },
          )),
        ]));
  }
}
