import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kreez/core/utils/assets_manager.dart';

import '../utils/app_colors.dart';

class DecodedImage extends StatelessWidget {
  int index ;
   DecodedImage({super.key,required this.base64String,this.index = 0});
  final dynamic base64String ;


  @override
  Widget build(BuildContext context) {
    Image image;
    if(base64String.runtimeType== String){
      Uint8List bytes = base64.decode(base64String);
       image = Image.memory(bytes,width: 60,);
    }
    else{
       image = Image.asset(ImageAssets.splashImage,color: AppColors.primary,);
    }


    return  CircleAvatar(
        radius:50,
        backgroundColor: AppColors.primary,
        child:  CircleAvatar(
        radius:48,
        backgroundColor: AppColors.white,
        child: image,)
      ,);
  }
}


class DecodedImage2 extends StatelessWidget {
  const DecodedImage2({super.key,required this.base64String});
  final dynamic base64String ;


  @override
  Widget build(BuildContext context) {
    ColorFilter removeBackgroundColorFilter = ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop);
    Image image;
    if(base64String.runtimeType== String){
      Uint8List bytes = base64.decode(base64String);
      image = Image.memory(bytes,width: 80,height: 100,);
    }
    else{
      image = Image.asset("assets/images/splash.png",color: AppColors.primary,width: 80,height: 80,fit: BoxFit.cover,);
    }


    return
      ColorFiltered(
      colorFilter: removeBackgroundColorFilter,
        child: image);
  }
}
