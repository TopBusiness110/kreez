import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/widgets/decoded_image.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
//
// class HomeProductItem extends StatelessWidget {
//   // ProductModel? productModel;
//   //   HomeProductItem({super.key,this.productModel});
//   final dynamic inSale ;
//   final String? productName;
//   final String? image;
//   final double? price;
//   final String? unit;
//   final int? id;
//   dynamic descriptionSale;
//  final double? quantity;
//    HomeProductItem({super.key,this.inSale,this.productName,this.image,
//     this.price,this.unit,this.descriptionSale,this.id,this.quantity});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     HomeCubit cubit = context.read<HomeCubit>();
//     return
//       InkWell(
//       onTap: () {
//         print("*********************************************");
//         print("name:${productName} , description = ${descriptionSale}");
//         Navigator.pushNamed(context, Routes.productDetailsRoute,
//             arguments: ProductModel(name:productName,image:image,
//                 description: descriptionSale,unit:unit,
//                 price:price ,id: id ));
//       },
//       child: Container(
//           width: 45.w,
//           decoration: BoxDecoration(
//               color: AppColors.lightGreen,
//               borderRadius: BorderRadius.circular(20)
//           ),
//           child:Column(
//             children: [
//               // Visibility(
//               //   visible:inSale.runtimeType==bool? inSale : false,
//               inSale.runtimeType==bool? inSale==false?
//                 Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 10),
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       alignment: Alignment.center,
//                       // height: 3.5.h,
//                       // width: 25.w,
//                       decoration: BoxDecoration(
//                         color: AppColors.red,
//                         borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
//                       ),
//                       child:Row(
//                         children: [
//                          // Text("10%",style: Theme.of(context).textTheme.bodySmall,),
//                           Text(" تخفيض",style: Theme.of(context).textTheme.bodySmall,),
//                         ],
//                       )
//                     ),
//                   ],
//                 ):SizedBox(height: 3.6.h,):SizedBox(height: 3.6.h,),
//              // ),
//
//               DecodedImage(base64String:image ),
//               Text("$productName",style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                   color: AppColors.black
//               ),),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Text("فواكة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   //     color: AppColors.primary,
//                   //     fontSize: 15
//                   // ),),
//                Row(children: [
//                  Text("$unit/",style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                      color: AppColors.primary,
//                      fontSize: 15
//                  ),),
//                  Text("$price",style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                      color: AppColors.primary,
//                      fontSize: 15
//                  ),),
//
//                ],)
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       width:5.w,
//                       height: 2.5.h,
//                       decoration: BoxDecoration(
//                           color: AppColors.lightGreen,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(color: AppColors.primary)
//                       ),
//                       child: IconButton(
//                           padding: EdgeInsets.zero,
//                           icon: Icon(Icons.add,size: 15,color: AppColors.primary,),
//
//                           onPressed: (){
//                             cubit.quantity = quantity!;
//                             cubit.increaseQuantity();
//                           }),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(8),
//                       alignment: Alignment.center,
//                       width:7.w,
//                       height: 3.2.h,
//                       decoration:BoxDecoration(
//                           color: AppColors.lightGreen,
//                           borderRadius: BorderRadius.circular(5)
//                       ),
//                       child: Text("$quantity",style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           color: AppColors.primary,
//                           fontSize: 12
//                       )),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       width:5.w,
//                       height: 2.5.h,
//                       decoration: BoxDecoration(
//                           color: AppColors.lightGreen,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(color: AppColors.primary)
//                       ),
//                       child: IconButton(
//                           padding: EdgeInsets.zero,
//                           icon: Icon(Icons.remove,size: 15,color: AppColors.primary,),
//
//                           onPressed: (){}),
//                     ),
//                     Spacer(),
//                     Container(
//                       padding: EdgeInsets.all(3),
//                       decoration: BoxDecoration(
//                         color: AppColors.primary,
//                         borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
//                       ),
//                       child: Icon(Icons.shopping_cart,color: AppColors.white,),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )
//       ),
//     );
//   },
// );
//   }
// }



class HomeProductItem2 extends StatelessWidget {
  ProductModel? productModel;
  //   HomeProductItem({super.key,this.productModel});

  HomeProductItem2({super.key,this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return
          InkWell(
            onTap: () {
              print("*********************************************");
              print("name:${productModel?.name} , description = ${productModel?.description}");
              Navigator.pushNamed(context, Routes.productDetailsRoute,
                  arguments: ProductModel(name:productModel?.name,image:productModel?.image,
                      description: productModel?.description,unit:productModel?.unit,
                      price:productModel?.price ,id: productModel?.id ));
            },
            child: Container(
                width: 45.w,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(20)
                ),
                child:Column(
                  children: [
                    // Visibility(
                    //   visible:inSale.runtimeType==bool? inSale : false,
                    productModel?.inSale.runtimeType==bool? productModel?.inSale==false?
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.center,
                            // height: 3.5.h,
                            // width: 25.w,
                            decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                            ),
                            child:Row(
                              children: [
                                // Text("10%",style: Theme.of(context).textTheme.bodySmall,),
                                Text(" تخفيض",style: Theme.of(context).textTheme.bodySmall,),
                              ],
                            )
                        ),
                      ],
                    ):SizedBox(height: 3.6.h,):SizedBox(height: 3.6.h,),
                    // ),

                    DecodedImage(base64String:productModel?.image ),
                    Text("${productModel?.name}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text("فواكة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //     color: AppColors.primary,
                        //     fontSize: 15
                        // ),),
                        Row(children: [
                          Text("${productModel?.unit}/",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.primary,
                              fontSize: 15
                          ),),
                          Text("${productModel?.price}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.primary,
                              fontSize: 15
                          ),),

                        ],)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width:5.w,
                            height: 2.5.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.add,size: 15,color: AppColors.primary,),

                                onPressed: (){
                                  cubit.quantity = productModel!.quantity!;
                                  cubit.increaseQuantity();
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            width:7.w,
                            height: 3.2.h,
                            decoration:BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("${productModel?.quantity}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: AppColors.primary,
                                fontSize: 12
                            )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width:5.w,
                            height: 2.5.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.remove,size: 15,color: AppColors.primary,),

                                onPressed: (){}),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                            ),
                            child: Icon(Icons.shopping_cart,color: AppColors.white,),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          );
      },
    );
  }
}