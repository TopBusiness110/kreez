import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kreez/core/utils/assets_manager.dart';
import 'package:kreez/core/utils/get_size.dart';

import '../utils/app_colors.dart';

class DecodedImage extends StatelessWidget {
  int index ;
   DecodedImage({super.key,required this.base64String,this.index = 0,required this.context});
  final dynamic base64String ;
  BuildContext context;
Widget convertImage(){
  Image image;
  if(base64String.runtimeType == String){
    Uint8List bytes = base64.decode(base64String);
    image = Image.memory(Uint8List.fromList(bytes));
      //  Image.memory(bytes,fit: BoxFit.cover,height: getSize(context)/4,);
  }
  else{
    image = Image.asset(ImageAssets.splashImage,color: AppColors.primary,);
  }
return image;
}

  @override
  Widget build(BuildContext context) {


    return
      CircleAvatar(
        radius:getSize(context)/6.8,
        backgroundColor: AppColors.green,
        child: CircleAvatar(
          radius:getSize(context)/7,
          backgroundColor: AppColors.white,
          child:
        ClipRRect(
          borderRadius: BorderRadius.circular(getSize(context)/7),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: getSize(context)/3.7,
              width: getSize(context)/3.7,
              child: convertImage()),
        )
          // CircleAvatar(
          // radius:48,
          // backgroundColor: AppColors.red,
          // child: image,)
        ,),
      );
  }
}


class DecodedImage2 extends StatefulWidget {
   DecodedImage2({super.key,required this.base64String});
  final dynamic base64String ;

  @override
  State<DecodedImage2> createState() => _DecodedImage2State();
}

class _DecodedImage2State extends State<DecodedImage2> {
  @override
  void initState() {
    convertImage();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return convertImage();
  }

  Widget convertImage() {
    Image image;

    if(widget.base64String.runtimeType== String){
      Uint8List bytes = base64.decode(widget.base64String);
      // image = Image.memory(bytes,width: 80,height: 100,);
      image = Image.memory(Uint8List.fromList(bytes));
    }
    else{
      image = Image.asset("assets/images/splash.png",color: AppColors.primary,);
    }
    return image;
  }
}
