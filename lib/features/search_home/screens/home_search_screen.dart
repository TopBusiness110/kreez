import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:kreez/features/search_home/cubit/home_search_cubit.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_textfield.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSearchCubit, HomeSearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeSearchCubit cubit = context.read<HomeSearchCubit>();
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    const SizedBox(width: 12,),
                    Expanded(
                      child: CustomTextField(

                        onchange: (p0) async {
                        await cubit.searchForProducts(p0);
                        },
                        prefixWidget: Icon(
                          Icons.search, color: AppColors.primary,),
                        title: "search_product".tr(),
                        textInputType: TextInputType.text,
                        backgroundColor: AppColors.green1,
                        textColor: AppColors.gray,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              ImageAssets.filterIcon,
                              width: 10,
                              height: 5,
                            ))),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.productsByCategoryIdModel?.result?.length??0,
                    itemBuilder: (context, index) {
                    return

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.productDetailsRoute,arguments: ProductModel(
                            id:  cubit.productsByCategoryIdModel?.result?[index].id,
                            price: cubit.productsByCategoryIdModel?.result?[index].listPrice,
                            image: cubit.productsByCategoryIdModel?.result?[index].image1920,
                           // unit: cubit.productsByCategoryIdModel?.result?[index].currencyId.toString(),
                            unit: "kg",
                            name: cubit.productsByCategoryIdModel?.result?[index].name,
                            description: cubit.productsByCategoryIdModel?.result?[index].descriptionSale
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${cubit.productsByCategoryIdModel?.result?[index].name??"no data"}",
                          style: TextStyle(color: AppColors.black1),),
                        ),
                      );
                  },),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
