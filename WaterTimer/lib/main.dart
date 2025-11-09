import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'water_tracker_model.dart';
import 'home_screen.dart';

void main() 
{
  runApp(ChangeNotifierProvider
  (
  create: (context) => WaterTrackerModel(),
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


