//home_page.dart dosyası için: 
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget 
{
const HomePage({super.key});

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
@override
Widget build(BuildContext context) {
return SafeArea(
child: Scaffold(
appBar: AppBar(
title: const Text("Mobile Uygulamam"),
centerTitle: true,
backgroundColor: const Color.fromARGB(255, 203, 88, 127),
),
drawer: Drawer(
child: ListView(
children: 
[
DrawerHeader(
child: Container(
color: Colors.amber,
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.account_circle),
Text(" Kullanıcı Adı"),
],
),
),
),
myMenuItem(Icons.home, "Ana Sayfa", "/home_page"),
myMenuItem(
Icons.notifications, "Bildirimler", "/notifications_page"),
myMenuItem(Icons.account_box, "Bana Ulaşın", "/about_page"),
],
),
),
body: Container(
height: 300.0,
alignment: Alignment.center,
margin: const EdgeInsets.all(100),
decoration: BoxDecoration(
shape: BoxShape.rectangle,
color: const Color.fromARGB(255, 240, 181, 4),
boxShadow: const [
BoxShadow(
color: Colors.black54,
blurRadius: 25,
spreadRadius: 2.0,
offset: Offset(15, 15),
),
],
border: Border.all(width: 4, color: Colors.white),
),
child: const Text(
textAlign: TextAlign.center,
"Bilişim Sistemleri",
style: TextStyle(
fontSize: 30.0,
),
),
),
));
}

Widget myMenuItem(IconData myicon, String mytitle, String myRoute) =>
ListTile(
leading: Icon(myicon, color: Colors.black),
title: Text(mytitle),
trailing: const Icon(Icons.arrow_forward, color: Colors.black),
onTap: () {
Navigator.pop(context);
Navigator.pushNamed(context, myRoute);
},
);
}
