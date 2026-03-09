import 'package:flutter/material.dart';
import 'package:frontend/src/features/welcome/application/welcome_notifier.dart';
import 'package:frontend/src/features/welcome/presentation/welcome_screen.dart';
import 'package:provider/provider.dart';

class FrontendApp extends StatelessWidget {
  const FrontendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WelcomeNotifier>(
      create: (_) => WelcomeNotifier()..start(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sandra Experiment',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF343739),
          fontFamily: 'Segoe UI',
          useMaterial3: true,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
