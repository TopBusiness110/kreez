// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kreez/core/models/all_categories_model.dart';
// import 'package:kreez/core/utils/app_colors.dart';
// import 'package:kreez/core/utils/get_size.dart';
// import 'package:kreez/features/home/cubit/home_cubit.dart';
// import 'package:kreez/features/product_details/models/product_model.dart';
// import 'package:kreez/features/products/cubit/products_cubit.dart';
// import 'package:sizer/sizer.dart';
// import '../../home/components/home_product_item.dart';
//
// class ProductsScreen extends StatefulWidget {
//   final AllCategoriesModel? allCategoriesModel;
//
//   const ProductsScreen({Key? key, this.allCategoriesModel}) : super(key: key);
//
//   @override
//   State<ProductsScreen> createState() => _ProductsScreenState();
// }
//
// class _ProductsScreenState extends State<ProductsScreen>
//     with SingleTickerProviderStateMixin {
//   late List<Color> colors;
//
//   @override
//   void initState() {
//     colors = List.generate(
//         widget.allCategoriesModel?.count ?? 0, (index) => AppColors.black);
//     context
//         .read<ProductsCubit>()
//         .tabController = TabController(
//         length: widget.allCategoriesModel!.count! + 1, vsync: this);
//     super.initState();
//     context.read<ProductsCubit>().getProductsByCategoryId(0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductsCubit, ProductsState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         ProductsCubit cubit = context.read<ProductsCubit>();
//         print("lllll");
//         print(widget.allCategoriesModel!.result![0].name!);
//         return Scaffold(
//             backgroundColor: AppColors.white,
//             body:
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   //appBar
//                   Container(
//                     width: double.infinity,
//                     //  height:15.h,
//                     decoration: BoxDecoration(
//                         color: AppColors.green,
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20))
//                     ),
//                     child: Column(
//
//                       children: [
//                         SizedBox(height: 5.h,),
//                         //appbar hi user
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 radius: 22,
//                                 backgroundColor: AppColors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 40,
//                                   color: AppColors.gray1,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                   "مرحبا , ${cubit.name ?? ""}",
//                                   style: Theme
//                                       .of(context)
//                                       .textTheme
//                                       .bodySmall
//                               ),
//                             ],
//                           ),
//                         ),
//                         Center(child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("products".tr(), style: Theme
//                               .of(context)
//                               .textTheme
//                               .bodyLarge),
//                         ),),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.h,
//                     child:
//                     // Row(
//                     //   children: [
//                     // SizedBox(width: 10,),
//                     // InkWell(
//                     //   onTap: (){
//                     //     cubit.changeAllTab(true);
//                     //   },
//                     //   child: Text("all".tr(),style: TextStyle(
//                     //     color:cubit.all? AppColors.primary:AppColors.black,
//                     //     fontWeight: FontWeight.w600,
//                     //     fontSize: getSize(context)*0.04
//                     //   ),),
//                     // ),
//                     TabBar(
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       indicatorColor: AppColors.primary,
//                       labelColor: AppColors.primary,
//                       unselectedLabelColor: AppColors.black,
//                       controller: cubit.tabController,
//                       indicatorWeight: 1,
//
//                       indicatorPadding: EdgeInsets.zero,
//                       padding: EdgeInsets.zero,
//                       isScrollable: true,
//
//                       // unselectedLabelStyle: TextStyle(fontSize: 10) ,
//
//                       //labelStyle: TextStyle(fontSize: 10),
//                       tabs: List.generate(
//                           widget.allCategoriesModel!.count! + 1,
//                               (index) {
//                             if (index == 0) {
//                               return InkWell(
//                                 onTap: () async {
//                                   cubit.changeAllTab(true);
//                                   cubit.tabController!.index = index;
//                                   await cubit.getAllProducts();
//                                 },
//                                 child: Text("all".tr(),
//                                   maxLines: 1,
//                                   style: TextStyle(
//
//                                       color: cubit.all
//                                           ? AppColors.primary
//                                           : AppColors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: getSize(context) * 0.03
//                                   ),),
//                               );
//                             }
//                             else {
//                               return InkWell(
//                                 onTap: () async {
//                                   cubit.changeAllTab(false);
//                                   cubit.tabController!.index = index;
//                                   await context.read<ProductsCubit>()
//                                       .getProductsByCategoryId(
//                                       widget.allCategoriesModel?.result?[index -
//                                           1].id ?? 0);
//                                 },
//                                 child: Text(
//                                   widget.allCategoriesModel!.result![index - 1]
//                                       .name!,
//                                   //textAlign: TextAlign.center,
//                                   maxLines: 1,
//                                   style: TextStyle(
//
//                                     //  color: cubit.tabController?.index == index?AppColors.primary:AppColors.black,
//                                     //   color:widget.allCategoriesModel!.result![index].isSelected?AppColors.primary:AppColors.black ,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: getSize(context) * 0.03),),
//                               );
//                             }
//                           }
//
//                       ),
//
//                     ),
//                     // Expanded(
//                     //   child: ListView.separated(
//                     //     separatorBuilder: (context, index) {
//                     //     return  const SizedBox(width: 10,);
//                     //     },
//                     //     scrollDirection: Axis.horizontal,
//                     //   //  isScrollable: true,
//                     //     physics: const AlwaysScrollableScrollPhysics(),
//                     //    padding:  EdgeInsets.symmetric(horizontal: getSize(context)*0.03,vertical: getSize(context)*0.04),
//                     //     itemCount: widget.allCategoriesModel!.result!.length,
//                     //       // automaticIndicatorColorAdjustment: true,
//                     //       // indicatorSize: TabBarIndicatorSize.label,
//                     //       // indicatorColor:AppColors.primary ,
//                     //       // labelColor: AppColors.primary,
//                     //       // unselectedLabelColor: AppColors.black,
//                     //       // controller:cubit.tabController,
//                     //       // labelStyle: const TextStyle(fontSize: 18),
//                     //       // tabs:
//                     //    itemBuilder: (context, index) {
//                     //      return
//                     //        InkWell(
//                     //        onTap: () async {
//                     //          cubit.changeAllTab(false);
//                     //
//                     //          var current = widget.allCategoriesModel!.result![index];
//                     //          cubit.changeTabColor(current);
//                     //        await  context.read<ProductsCubit>().getProductsByCategoryId(widget.allCategoriesModel?.result?[index].id??0);
//                     //
//                     //        },
//                     //          child: Text(widget.allCategoriesModel!.result![index].name!,
//                     //            style: TextStyle(
//                     //                color:widget.allCategoriesModel!.result![index].isSelected?AppColors.primary:AppColors.black ,
//                     //                fontWeight: FontWeight.w600,
//                     //                fontSize: getSize(context)*0.04 ),),
//                     //      );
//                     //
//                     //      //   widget.allCategoriesModel!.result!.map((e) => Padding(
//                     //      //   padding: const EdgeInsets.all(8.0),
//                     //      //   child: Text(e.name!,style: TextStyle(color: AppColors.primary),),
//                     //      // )).toList()
//                     //    },
//                     //
//                     //   ),
//                     //  ]     // ),
//                     // ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.symmetric(horizontal: 12),
//                       height: 74.h,
//                       child:
//                       // cubit.productsByCategoryIdModel?.count==0?
//                       cubit.all ?
//                       state is LoadingAllProductState ?
//                       Center(child: CircularProgressIndicator(
//                         color: AppColors.primary,),)
//                           : GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 10,
//                             crossAxisSpacing: 10,
//                             mainAxisExtent: 240
//
//                         ),
//                         itemCount: context
//                             .read<HomeCubit>()
//                             .allProductsModel
//                             ?.count ?? 0,
//                         itemBuilder: (context, index) {
//                           return HomeProductItem2(productModel: ProductModel(
//                               name: context
//                                   .read<HomeCubit>()
//                                   .allProductsModel
//                                   ?.result?[index].name,
//                               image: context
//                                   .read<HomeCubit>()
//                                   .allProductsModel
//                                   ?.result?[index].image1920,
//                               price: context
//                                   .read<HomeCubit>()
//                                   .allProductsModel
//                                   ?.result?[index].listPrice,
//                               // unit: cubit.productsByCategoryIdModel!.result?[index].currencyId.toString(),
//                               unit: "kg",
//                               id: context
//                                   .read<HomeCubit>()
//                                   .allProductsModel
//                                   ?.result?[index].id),
//                           );
//                         },) :
//                       state is LoadingProductState ?
//                       Center(child: CircularProgressIndicator(
//                         color: AppColors.primary,)) :
//                       GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 10,
//                             crossAxisSpacing: 10,
//                             mainAxisExtent: 240
//
//                         ),
//                         itemCount: cubit.productsByCategoryIdModel?.count ?? 0,
//                         itemBuilder: (context, index) {
//                           return HomeProductItem2(productModel: ProductModel(
//                               name: cubit.productsByCategoryIdModel!
//                                   .result?[index].name,
//                               image: cubit.productsByCategoryIdModel!
//                                   .result?[index].image1920,
//                               price: cubit.productsByCategoryIdModel!
//                                   .result?[index].listPrice,
//                               // unit: cubit.productsByCategoryIdModel!.result?[index].currencyId.toString(),
//                               unit: "kg",
//                               id: cubit.productsByCategoryIdModel!
//                                   .result?[index].id),
//                           );
//                         },)
//                     // ListView.builder(
//
//                   )
//                 ],
//               ),
//             ));
//       },
//     );
//   }
// }







import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/core/utils/get_size.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:kreez/features/products/cubit/products_cubit.dart';
import '../../home/components/home_product_item.dart';

class ProductsScreen extends StatefulWidget {
  final AllCategoriesModel? allCategoriesModel;
  final int id;

  const ProductsScreen({Key? key, this.allCategoriesModel, required this.id,}) : super(key: key);


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  late List<Color> colors;

  @override
  void initState() {
    super.initState();

    //search for correct tab
    print("widget.id");
    print(widget.id);

   if(widget.id==0){
   //  context.read<ProductsCubit>().all==true;

     context.read<ProductsCubit>().getAllProducts();

   }
   else{
    // context.read<ProductsCubit>().all==false;

     context.read<ProductsCubit>().getProductsByCategoryId(widget.id);
   }


    int? currentTab = 0;
    for(int i=0;i<widget.allCategoriesModel!.result!.length;i++){
      if(widget.allCategoriesModel!.result![i].id==widget.id){
        currentTab = i+1;
      }
    }
    colors = List.generate(
        widget.allCategoriesModel!.result!.length??0,
            (index) => AppColors.black);
    context
        .read<ProductsCubit>()
        .tabController = TabController(
      initialIndex: currentTab??0,
       // length: widget.allCategoriesModel!.count! + 1, vsync: this);
        length: widget.allCategoriesModel!.result!.length + 1, vsync: this);


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
            Column(
              children: [
                //appBar
                Container(
                  width: double.infinity,
                  //  height:15.h,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: getSize(context)*0.1,),
                      //appbar hi user
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 22,
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
                                "مرحبا , ${cubit.name ?? ""}",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall
                            ),
                          ],
                        ),
                      ),
                      Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("products".tr(), style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge),
                      ),),
                    ],
                  ),
                ),
                //tab bar
                SizedBox(
                //  height: getSize(context)*0.6,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.black,
                      controller: cubit.tabController,
                      indicatorWeight: 1,
                      indicatorPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      tabs: List.generate(
                          widget.allCategoriesModel!.count! + 1,
                              (index) {
                            if (index == 0) {
                              return InkWell(
                                onTap: () async {
                                  cubit.changeAllTab(true);
                                  cubit.tabController!.index = index;
                                  await cubit.getAllProducts();
                                },
                                child: Text("all".tr(),
                                  maxLines: 1,
                                  style: TextStyle(

                                      color: cubit.all
                                          ? AppColors.primary
                                          : AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getSize(context) * 0.03
                                  ),),
                              );
                            }
                            else {
                              return InkWell(
                                onTap: () async {
                                  cubit.changeAllTab(false);
                                  cubit.tabController!.index = index;
                                  await context.read<ProductsCubit>()
                                      .getProductsByCategoryId(
                                      widget. allCategoriesModel!.result?[index -
                                          1].id ?? 0);
                                },
                                child: Text(
                                  widget.allCategoriesModel!.result![index - 1]
                                      .name!,
                                  //textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(

                                    //  color: cubit.tabController?.index == index?AppColors.primary:AppColors.black,
                                    //   color:widget.allCategoriesModel!.result![index].isSelected?AppColors.primary:AppColors.black ,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getSize(context) * 0.03),),
                              );
                            }
                          }

                      ),

                    ),
                  ),

                ),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    //  height: getSize(context)*1.5,

                      child:
                      // cubit.productsByCategoryIdModel?.count==0?

                      state is LoadingAllProductState ?
                      Center(child: CircularProgressIndicator(
                        color: AppColors.primary,),)
                          :
                      state is AllProductFailureState
                      ?Center(child: CircularProgressIndicator(
                        color: AppColors.primary,),):
                      GridView.builder(shrinkWrap: true,

                            physics: const BouncingScrollPhysics(),

                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,

                            crossAxisSpacing: 10,

                            mainAxisExtent: 240

                        ),
                        itemCount:
                        cubit.all==true?(
                        context
                            .read<HomeCubit>()
                            .allProductsModel
                            ?.count ?? 0):
                        cubit.productsByCategoryIdModel!
                            .result?.length??0,
                        // (
                        //     context
                        //         .read<HomeCubit>()
                        //         .allCategoriesModel
                        //         ?.count ?? 0
                        // ),
                        itemBuilder: (context, index) {
                          return cubit.all==true?
                          HomeProductItem2(
                            productModel: ProductModel(
                              name: context
                                  .read<HomeCubit>()
                                  .allProductsModel
                                  ?.result?[index].name,
                              image: context
                                  .read<HomeCubit>()
                                  .allProductsModel
                                  ?.result?[index].image1920,
                              price: context
                                  .read<HomeCubit>()
                                  .allProductsModel
                                  ?.result?[index].listPrice,
                              // unit: cubit.productsByCategoryIdModel!.result?[index].currencyId.toString(),
                              unit: "kg",
                              id: context
                                  .read<HomeCubit>()
                                  .allProductsModel
                                  ?.result?[index].id),
                          ):
                          HomeProductItem2(
                            productModel: ProductModel(
                              name: cubit.productsByCategoryIdModel!
                                  .result?[index].name,
                              image: cubit.productsByCategoryIdModel!
                                  .result?[index].image1920,
                              price: cubit.productsByCategoryIdModel!
                                  .result?[index].listPrice,
                              // unit: cubit.productsByCategoryIdModel!.result?[index].currencyId.toString(),
                              unit: "kg",
                              id: cubit.productsByCategoryIdModel!
                                  .result?[index].id),
                          );
                        },)

                  ),
                )
              ],
            ));
      },
    );
  }
}


