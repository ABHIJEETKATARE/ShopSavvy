import 'dart:async';

import 'package:amazon_tutorial/generate_routes.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:amazon_tutorial/reusable/bottom_bar.dart';
import 'package:amazon_tutorial/screens/auth_screen.dart';
import 'package:amazon_tutorial/screens/homescreen/homescreen.dart';
import 'package:amazon_tutorial/self%20testing/test.dart';
import 'package:amazon_tutorial/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  authService obj = authService();
  @override
  void initState() {
    super.initState;
    test(context);
    obj.getToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        return generateRoute(settings);
      },
      home: abhi(),
    );
  }
}

class abhi extends StatefulWidget {
  @override
  _abhi createState() => _abhi();
}

class _abhi extends State<abhi> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context).user.token.isEmpty
        ? authScreen()
        : const BottomBarState();
  }
}
