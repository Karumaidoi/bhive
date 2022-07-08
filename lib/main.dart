import 'package:bhive/services/anime.dart';
import 'package:bhive/ui/splash_screen.dart';
import 'package:bhive/utils/locataor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final appDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
  }
  Hive.registerAdapter(AnimeAdapter());
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bHive',
      theme: ThemeData(
        fontFamily: 'Turing',
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
        primaryColor: Colors.grey[850],
      ),
      home: const SplashScreen(),
    );
  }
}
