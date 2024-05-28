import 'package:flutter/material.dart';
import 'package:frontend/components/drawer.dart';


class UserEventsPage extends StatelessWidget {
  const UserEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Events'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('My Events')
      ),
    );
  }
}
