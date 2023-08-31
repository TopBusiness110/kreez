import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return  Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
             height:15.h,
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Column(

              children: [
                SizedBox(height: 0.1.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius:22,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.gray1,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "مرحبا , محمد",
                        style: Theme.of(context).textTheme.bodySmall
                      ),
                    ],
                  ),
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("cart".tr(),style: Theme.of(context).textTheme.bodyLarge),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

