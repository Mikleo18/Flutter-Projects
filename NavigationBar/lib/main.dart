import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'notifications_page.dart';

void main()
{
runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
const MyApp({super.key});

@override
Widget build(BuildContext context) 
{
return MaterialApp(
routes: 
{
"/home_page": (context) => const HomePage(),
"/about_page": (context) => const AboutPage(),
"/notifications_page": (context) => const NotificationsPage(),
},
home: const HomePage(),
debugShowCheckedModeBanner: false,
);
}
}
 
 

 
 

 
