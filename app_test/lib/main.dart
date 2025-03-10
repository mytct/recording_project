import 'package:app_core/config/di.dart';
import 'package:app_test/db/local_db.dart';
import 'package:app_test/di/di.dart';
import 'package:app_test/features/home/home_view.dart';
import 'package:app_widget/example_view/safe_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDi();
  configureDependencies();
  await Hive.initFlutter();
  await LocalDb.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Recording")),
        body: SafeAreaWidget(childView: HomeView()),
      ),
    );
  }
}
