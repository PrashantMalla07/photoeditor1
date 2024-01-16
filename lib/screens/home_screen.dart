// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';



import '../services/app_image_provider.dart';
import '../utilis/app_image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late AppImageProvider imageProvider;
 
  @override
  void initstate(){
    imageProvider=Provider.of<AppImageProvider>(context,listen:false);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
          children: [
            SizedBox(
              width: double.infinity,
              height: 1000,
              child: Container(
                child: Image.asset(
                  'assets/images/images2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
               const Expanded(child: Center(
                  child: Text("Photo Editor",
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 247, 246),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    wordSpacing: 10,
                  ),
                  ),
                ),),
                Expanded(child: Container(),),
              
                Expanded(
                  child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AppImagePicker(source: ImageSource.gallery)
                        .pick(onPick:(File? image){
                          Provider.of<AppImageProvider>(context,listen:false).changeImageFile(image!);
                          Navigator.of(context).pushReplacementNamed('/home');
                        });
                      },
                      child:const Text("Gallery"),
                    ),
                       ElevatedButton(
                      onPressed: () {
                        AppImagePicker(source: ImageSource.camera)
                        .pick(onPick:(File? image){
                         Provider.of<AppImageProvider>(context,listen:false).changeImageFile(image!);
                          Navigator.of(context).pushReplacementNamed('/home');
                        });
                      },
                      child: Text("Camera"),
                    ),
                
      
                  ],
                )))
              ],
            )
          ],
        ),
    
    );
  }
}