import 'package:finva_tech_task/constants/exports.dart';

void main() {
  runApp(const BetterFeedback(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: MyTheme.theme,
      home: const HomeScreen(),
    );
  }
}
