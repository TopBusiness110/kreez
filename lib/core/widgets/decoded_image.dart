import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DecodedImage extends StatelessWidget {
  const DecodedImage({super.key,required this.base64String});
  final dynamic base64String ;


  @override
  Widget build(BuildContext context) {
    Image image;
    if(base64String.runtimeType== String){
      Uint8List bytes = base64.decode(base64String);
       image = Image.memory(bytes,width: 60,);
    }
    else{
       image = Image.asset("assets/images/splash.png",color: AppColors.primary,);
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
