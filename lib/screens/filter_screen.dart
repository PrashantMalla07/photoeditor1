import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_editor/utilis/filters.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../model/filter.dart';
import '../services/app_image_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  late Filter currentFilter;
  late List<Filter>filters;
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController=ScreenshotController();

  @override

  void initState(){
    
    filters = Filters().list();
    currentFilter = filters[0];
    imageProvider =Provider.of<AppImageProvider>(context,listen:false);
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: const CloseButton(),
        title:const Text('Filters'),
        actions: [
          IconButton(onPressed: () async{
           
          Uint8List? bytes=await screenshotController.capture();  
    
           imageProvider.changeImage(bytes!);
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
           
            
            return Screenshot(
              controller: screenshotController,
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(currentFilter.matrix),
                  
                 
                child: Image.memory(value.currentImage!)
                ),
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
        height: 90,
        color: Colors.black,
        child: SafeArea(
          child: Consumer<AppImageProvider>(
            builder: (BuildContext context, value, Widget? child ){
              
            
             return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (BuildContext context,int index){
                Filter filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                currentFilter=filter;
                              });
                            },
                            child: ColorFiltered(
                              colorFilter: ColorFilter.matrix(filter.matrix),
                              child: Image.memory(value.currentImage!),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                     Expanded(
  child: Text(
    filter.filterName,
    style: const TextStyle(color: Colors.white),
    textAlign: TextAlign.center, // Adjust text alignment if necessary
  ),
),


                    ],
                  ),
                );
              },
            );
            }
          ),
        ),
      ),
    );

  }
  
 
}