import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main ()
{
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: CameraApp(),
    );
  }
}

class CameraApp extends StatefulWidget 
{
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> 
{
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void>_takePhoto()async
  {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if(photo!=null)
    {
      setState(() 
      {
        _image = File(photo.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Kamera"),centerTitle: true,),
      body:  Center
      (child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: 
      [
        buildImage(),
        ElevatedButton(onPressed: _takePhoto, child: const Text("Foto çek")),
      ],),),
    );
  }
  Widget buildImage()
  {
    if(_image !=null)
    {
      return Image.file(_image!,width:300,height: 300,);
    }else
    {
      return const Text("Resim Çekilmedi");

    }

  }
}