import 'package:expense_app/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
// if you use future in main function allways if you use async and await or then you must use this line before it (class WidgetsFlutterBinding)

WidgetsFlutterBinding.ensureInitialized();
  // this to make app use the horizantal only or vartical only (landscape)
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      //if you have function and this function has value and you dont need to use it you but _ like  .then((_) => runApp(const MyApp()));
      .then((_) => runApp(const MyApp()));
}

var myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var myDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: myColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: myColorScheme.onSecondaryContainer)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        bottomSheetTheme: BottomSheetThemeData()
            .copyWith(backgroundColor: myDarkColorScheme.primaryContainer),
        useMaterial3: true,
        colorScheme: myDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: myDarkColorScheme.onSecondaryContainer)),
      ),
      home: Expenses(),
    );
  }
}
