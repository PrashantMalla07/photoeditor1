

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppImageProvider extends ChangeNotifier{
  Uint8List? currentImage;

  changeImageFile(File image){
         try {
      currentImage = image.readAsBytesSync();
      notifyListeners();
    } catch (e) {
      print('Error loading image: $e');
      // Handle the error as needed
    }

  }
  changeImage(Uint8List image){
    currentImage=image;
    notifyListeners();
  }

}