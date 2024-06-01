import 'package:flutter/material.dart';
import 'package:frontend/components/drawer.dart';

// UserEventsPage represents the user's events. It includes a header, a drawer for navigation, and the user's events.
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
      drawer: AppDrawer(), // Drawer with navigation options
      body: const Center(
        child: Text('My Events')
      ),
    );
  }
}
