import 'package:flutter/material.dart';
import 'package:inherited_widget/controllers/state_widget.dart';
import 'package:inherited_widget/views/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(
        builder: (context) {
          final stateWidget = StateInheritedWidget.of(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: stateWidget.state.primarySwatch,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: stateWidget.state.primarySwatch,),
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        }
      ),
    );
  }
}
