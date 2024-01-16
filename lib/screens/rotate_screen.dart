import 'dart:typed_data';
import 'dart:ui';


import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:photo_editor/src/controller/crop_controller.dart';
//import 'package:photo_editor/src/crop_image.dart';



import 'dart:ui' as ui;

import '../services/app_image_provider.dart';

class RotateScreen extends StatefulWidget {
  const RotateScreen({super.key});

  @override
  State<RotateScreen > createState() => _RotateScreenState();
}

class _RotateScreenState extends State<RotateScreen > {   
  final controller = CropController(
 
  //aspectRatio: 1,
 
  //defaultCrop: Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
);
late AppImageProvider imageProvider;
  
  @override
  void initState() {
    imageProvider =Provider.of<AppImageProvider>(context,listen:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title:const Text('Rotate'),
        actions: [
          IconButton(onPressed: () async{
           ui.Image bitmap = await controller.croppedBitmap();
           ByteData? data = await bitmap.toByteData(format: ImageByteFormat.png);
           Uint8List bytes= data!.buffer.asUint8List();  
    
           imageProvider.changeImage(bytes);
           if(mounted) return;
           Navigator.of(context).pop();
          },
           icon:const Icon(Icons.done))
        ],
      ),
          body: Center(
        child: Consumer<AppImageProvider>(
          builder: (BuildContext context, value, Widget? child ){
            if(value.currentImage !=null){
              return  CropImage(
            controller: controller,
            
            image: Image.memory(value.currentImage!),
       
            
          );
        
              
            }
            return const Center(
              child:CircularProgressIndicator(),
            );
          },
          ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        color: Colors.black,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                  _bottomBatItem(
                    child:const Icon(Icons.rotate_right_outlined,color: Colors.white,size: 35,),
                    onPress: (){
                      controller.rotateRight();
                    }),
                      _bottomBatItem(
                    child:const Icon(Icons.rotate_left_outlined,color: Colors.white,size: 35,),
                    onPress: (){
                      controller.rotateLeft();
                    }),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _bottomBatItem({required child,required onPress}){
    return InkWell(
      onTap: onPress,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: child,
      ),
     
      )
      
    );
  }
    
  }

