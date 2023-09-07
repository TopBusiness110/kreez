import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/models/all_products_model.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/features/products/cubit/products_cubit.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatefulWidget {
  final AllProductsModel? allProductsModel;
  const ProductsScreen({Key? key,this.allProductsModel}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    
    super.initState();
    context.read<ProductsCubit>().tabController = TabController(length: 3, vsync: this);
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
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor:AppColors.primary ,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.black,
                controller:cubit.tabController,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Text("completed_orders".tr(),),
                  Text("next_orders".tr(),),
                  Text("canceled_orders".tr(),),
                ]),
          ],
        ),
      ))      ;

  },
);
  }
}
