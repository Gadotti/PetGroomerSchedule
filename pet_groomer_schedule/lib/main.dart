import 'package:flutter/material.dart';
import 'package:pet_groomer_schedule/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Groomer Schedules',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("pt", "BR"),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primarySwatch: Colors.red,
        fontFamily: "Montserrat"
      ),
      home: Home(),
    );
  }
}


