import 'package:flutter/material.dart';
import 'package:test_notifaction/notifaction_servise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotifyHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestNotification(),
    );
  }
}

class TestNotification extends StatelessWidget {
  const TestNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                NotifyHelper.showBasicNotification();
              },
              leading: const Icon(Icons.notifications),
              title: const Text('Simple Notification'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  NotifyHelper.cancelNotification(0);
                },
              ),
            ),
            ListTile(
              onTap: () {
                NotifyHelper.showPeriodicallyNotification();
              },
              leading: const Icon(Icons.notifications_active),
              title: const Text('Periodic Notification'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  NotifyHelper.cancelNotification(1);
                },
              ),
            ),
            ListTile(
              onTap: () {
                NotifyHelper.showScheduledNotification();
              },
              leading: const Icon(Icons.notification_add_sharp),
              title: const Text('Scheduled Notification'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  NotifyHelper.cancelNotification(2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
