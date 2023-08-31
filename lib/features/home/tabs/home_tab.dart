
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                color: AppColors.gray,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "مرحبا , محمد",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                prefixWidget: Icon(Icons.search),
                title: "search_product".tr(),
                textInputType: TextInputType.text,
                backgroundColor: AppColors.green1,
                textColor: AppColors.gray,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.search,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}