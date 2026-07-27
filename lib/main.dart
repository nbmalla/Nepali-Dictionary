import 'package:flutter/material.dart';
import 'screens/root_shell.dart';
import 'state/app_settings.dart';
import 'state/progress_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettings.instance.load();
  await ProgressStore.instance.load();
  runApp(const NepDictionaryApp());
}

class NepDictionaryApp extends StatelessWidget {
  const NepDictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppSettings.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Japanese for Nepali',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F5CA6)),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7CA6E8),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          builder: (context, child) {
            final mq = MediaQuery.of(context);
            return MediaQuery(
              data: mq.copyWith(textScaler: TextScaler.linear(AppSettings.instance.fontScale)),
              child: child!,
            );
          },
          home: const RootShell(),
        );
      },
    );
  }
}
