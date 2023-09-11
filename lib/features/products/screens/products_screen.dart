import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/core/models/all_products_model.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/features/products/cubit/products_cubit.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatefulWidget {
  final AllCategoriesModel? allCategoriesModel;
  const ProductsScreen({Key? key,this.allCategoriesModel}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>  {
  
  @override
  void initState() {
    
    super.initState();

    context.read<ProductsCubit>().getProductsByCategoryId(0);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    ProductsCubit cubit = context.read<ProductsCubit>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body:
      SingleChildScrollView(

        child: Column(
          children: [
            //appBar
            Container(
              width: double.infinity,
              //  height:15.h,
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Column(

                children: [
                  SizedBox(height: 5.h,),
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
                    child: Text("products".tr(),style: Theme.of(context).textTheme.bodyLarge),
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                return  const SizedBox(width: 10,);
                },
                scrollDirection: Axis.horizontal,
              //  isScrollable: true,
                physics: const AlwaysScrollableScrollPhysics(),
               padding: const EdgeInsets.all(8),
                itemCount: widget.allCategoriesModel!.result!.length,
                  // automaticIndicatorColorAdjustment: true,
                  // indicatorSize: TabBarIndicatorSize.label,
                  // indicatorColor:AppColors.primary ,
                  // labelColor: AppColors.primary,
                  // unselectedLabelColor: AppColors.black,
                  // controller:cubit.tabController,
                  // labelStyle: const TextStyle(fontSize: 18),
                  // tabs:
               itemBuilder: (context, index) {
                 return  InkWell(
                   onTap: () async {
                   await  context.read<ProductsCubit>().getProductsByCategoryId(widget.allCategoriesModel?.result?[index].id??0);
                   },
                     child: Text(widget.allCategoriesModel!.result![index].name!,style: TextStyle(color: AppColors.primary),));

                 //   widget.allCategoriesModel!.result!.map((e) => Padding(
                 //   padding: const EdgeInsets.all(8.0),
                 //   child: Text(e.name!,style: TextStyle(color: AppColors.primary),),
                 // )).toList()
               },

              ),
            ),
            Container(
              color: AppColors.purple1light,
              height: 74.h,
                child:
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cubit.productsByCategoryIdModel?.count??0,
                itemBuilder: (context, index) {

                return Text(cubit.productsByCategoryIdModel!.result?[index].name??"no items",style: TextStyle(color: AppColors.black1),);
              },)
            //     TabBarView(
            //       controller: cubit.tabController,
            //   children: widget.allCategoriesModel!.result!.map((e) => Text(
            //     // cubit.getProductsByCategoryId(e.id!)
            //     cubit.productsByCategoryIdModel?.result?[cubit.tabController!.index].name.toString()??"99999999",style: TextStyle(color: AppColors.primary),
            //   )).toList()
           //  )
      )
          ],
        ),
      )) ;

  },
);
  }
}
