
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/utils/app_strings.dart';
import 'package:kreez/core/widgets/decoded_image.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/home/product_item_cubit/product_item_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/get_size.dart';




class HomeProductItem2 extends StatelessWidget {

  ProductModel? productModel;
  HomeProductItem2({super.key,this.productModel});
  //
  // int index=0;

  @override
  Widget build(BuildContext context) {
    return
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.productDetailsRoute,
                  arguments: ProductModel(
                    quantity:productModel?.quantity??0 ,
                      ribbon: productModel?.ribbon,
                      name:productModel?.name,
                      image:productModel?.image,
                      description: productModel?.description,
                      unit:productModel?.unit,
                      price:productModel?.price ,
                      id: productModel?.id ));
            },
            child: Container(
                width:getSize(context)*0.55,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(20)
                ),
                child:Column(
                  children: [
                    // Visibility(
                    //   visible:inSale.runtimeType==bool? inSale : false,
                    productModel?.ribbon.runtimeType==int?
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
                                Text("${productModel?.ribbon==4?'جديد':productModel?.ribbon==3?'انتهي من المخزن':productModel?.ribbon==2?'نفذت الكميه':'تخفيض'}",style: Theme.of(context).textTheme.bodySmall,),
                              ],
                            )
                        ),
                      ],
                    ):
                    SizedBox(height: getSize(context)*0.01,),
                     Flexible(child: SizedBox(
                     //  width: getSize(context)/3,
                         child: DecodedImage2(base64String:productModel?.image, ))),


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
                            width:getSize(context)*0.1,
                             height: getSize(context)*0.1,
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
                            width:getSize(context)*0.1,
                            height: getSize(context)*0.1,
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
                            width:getSize(context)*0.1,
                            height: getSize(context)*0.1,
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


  Future<void> removeImageBackground(String imageUrl) async {
    final response = await http.post(
      Uri.parse('https://api.remove.bg/v1.0/removebg'),
      headers: {
        'X-Api-Key': AppStrings.imageApiKey,
      },
      body: json.encode({
        'image_url': imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      // Image background removed successfully.
      // You can now display or save the processed image.
      print('Image background removed successfully!');
    } else {
      // Handle API error.
      print('Error removing image background: ${response.body}');
    }
  }



}