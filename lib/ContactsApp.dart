import 'package:contacts/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ContactsApp extends StatelessWidget  {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      theme: ThemeData(fontFamily: "Inter"),
      routes: {HomeScreen.screenName: (context) => HomeScreen()},
      initialRoute: HomeScreen.screenName,
    );
  }
}
