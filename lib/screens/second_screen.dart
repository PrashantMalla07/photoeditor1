



import 'package:flutter/material.dart';




import 'package:photo_editor/services/app_image_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
 
 
  //    Future<void> _saveImage(BuildContext context) async {
  //   final appImageProvider = Provider.of<AppImageProvider>(context, listen: false);

  //   if (appImageProvider.currentImage != null) {
  //     try {
  //       // Request permission to save to gallery
  //       var status = await Permission.storage.request();
  //       if (status != PermissionStatus.granted) {
  //         // Handle the case where permission is not granted
  //         return;
  //       }

  //       // Save the image to the gallery using platform channel
  //       final result = await _saveImageToGallery(appImageProvider.currentImage!);

  //       if (result) {
  //         // Show a confirmation message
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Image saved to gallery'),
  //           ),
  //         );
  //       } else {
  //         // Handle the case where the image couldn't be saved
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Error saving image to gallery'),
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       print('Error saving image: $e');
  //       // Handle the error as needed
  //     }
  //   } else {
  //     // Handle the case where there is no image to save
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('No image to save!'),
  //       ),
  //     );
  //   }
  // }

  // Future<bool> _saveImageToGallery(Uint8List imageData) async {
  //   const platform = MethodChannel('your_channel_name');
  //   try {
  //     // Invoke the native method to save the image
  //     await platform.invokeMethod('saveImageToGallery', {'imageData': imageData});
  //     return true;
  //   } on PlatformException catch (e) {
  //     // Handle the platform exception
  //     print('Error saving image to gallery: $e');
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Editor"),
        leading: CloseButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: const Text('Save'),
          )
        ],
      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.currentImage != null) {
              return Image.memory(
                value.currentImage!,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
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
              
                _bottomBarItem(
                  Icons.crop,
                  'Crop',
                  onPress: () {
                    Navigator.of(context).pushNamed('/crop');
                  },
                ),
                _bottomBarItem(
                  Icons.rotate_90_degrees_cw_rounded,
                  'Rotate',
                  onPress: () {
                    Navigator.of(context).pushNamed('/rotate');
                  },
                ),
                _bottomBarItem(
                  Icons.filter_vintage_outlined,
                  'Filters',
                  onPress: () {
                    Navigator.of(context).pushNamed('/filter');
                  },
                ),
                _bottomBarItem(
                  Icons.adjust_outlined,
                  'Adjust',
                  onPress: () {
                    Navigator.of(context).pushNamed('/adjust');
                  },
                ),
              
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBarItem(IconData icon, String title, {required onPress}) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(height: 3,),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }




}
