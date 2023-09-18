
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/widgets/decoded_image.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/home/product_item_cubit/product_item_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/app_colors.dart';




class HomeProductItem2 extends StatelessWidget {

  ProductModel? productModel;
  HomeProductItem2({super.key,this.productModel});

  int index=0;

  @override
  Widget build(BuildContext context) {
    return


          InkWell(
            onTap: () {

              Navigator.pushNamed(context, Routes.productDetailsRoute,
                  arguments: ProductModel(
                    quantity:productModel?.quantity??0 ,
                      inSale: productModel?.inSale,
                      name:productModel?.name,
                      image:productModel?.image,
                      description: productModel?.description,
                      unit:productModel?.unit,
                      price:productModel?.price ,
                      id: productModel?.id ));
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
                    DecodedImage2(base64String:productModel?.image ),
                    Text("${productModel?.name}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black,
                      fontSize: 14
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                    BlocBuilder<ProductItemCubit, ProductItemState>(
                   builder: (context, state) {
                     ProductItemCubit cubit = context.read<ProductItemCubit>();
                      return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width:10.w,
                             height: 3.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.add,size: 15,color: AppColors.primary,),

                                onPressed: (){
                                  cubit.increase(productModel!,context);

                                }),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            width:10.w,
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
                            width:10.w,
                            height: 3.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.remove,size: 15,color: AppColors.primary,),

                                onPressed: (){
                                  cubit.decrease( productModel!,context);

                                }),
                          ),
                          // Spacer(),
                          // InkWell(
                          //   onTap: () async {
                          //   await  cubit.addToCart(widget.productModel! , context);
                          //   },
                          //   child: Container(
                          //     padding: EdgeInsets.all(3),
                          //     decoration: BoxDecoration(
                          //       color: AppColors.primary,
                          //       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                          //     ),
                          //     child: Icon(Icons.shopping_cart,color: AppColors.white,),
                          //   ),
                          // )
                        ],
                      ),
                    );
  },
),
                  ],
                )
            ),
          );
      }


}