import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class CopyrightWidget extends StatelessWidget {
  final double width;
  const CopyrightWidget({super.key,required this.width});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(ImageAssets.copyrightSplashImage,width:width*0.4,height: 30,color: AppColors.gray,);
  }
}
