import 'package:flutter/material.dart';
import 'package:tonnsour/components/customization/BottomBar.dart';
import 'package:tonnsour/models/goal.dart';
import 'package:tonnsour/pages/loading_page.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/utils/services/goals_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StartIsar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TONNSOUR',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BottomBar(),
    );
  }
}
