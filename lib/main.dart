import 'package:flutter/material.dart';
import 'package:photo_editor/screens/adjust.dart';

import 'package:photo_editor/screens/crop.dart';
import 'package:photo_editor/screens/filter_screen.dart';
import 'package:photo_editor/screens/home_screen.dart';
import 'package:photo_editor/screens/rotate_screen.dart';
import 'package:photo_editor/screens/second_screen.dart';

import 'package:photo_editor/services/app_image_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>AppImageProvider())
    ],
    child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo editor',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 52, 49, 49),
      
      primarySwatch: Colors.blue,
      appBarTheme:const AppBarTheme(
        color: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      ),
    
      routes: <String, WidgetBuilder>{
        '/':(_)=>const HomeScreen(),
        '/home':(_)=>const SecondScreen(),
        
        '/crop':(_)=>const CropScreen(),
           '/rotate':(_)=>const RotateScreen(),
            '/filter':(_)=>const FilterScreen(),
            '/adjust':(_)=> AdjustScreen(),
           // '/text':(_)=>const RotateScreen(),
      },
      initialRoute: '/',
    );
  }
}

