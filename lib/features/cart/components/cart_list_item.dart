
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/decoded_image.dart';
import '../../product_details/models/product_model.dart';

class CartListItem extends StatelessWidget {
  final ProductModel? product;

  const CartListItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 2.0, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: AppColors.gray, blurRadius: 5)
          ]

      ),
      child: Stack(
        children: [
          Card(
            child: Row(
              //  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              children: [
                SizedBox(
                  // width: 14.w,
                    child: DecodedImage2(
                      base64String: product?.image,
                    )),
                //Image.asset("assets/images/strawberry.png",),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("${product?.name}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color:
                            AppColors.black1)),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        CartCubit cubit = context.read<CartCubit>();
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 7.w,
                              height: 3.3.h,
                              decoration: BoxDecoration(
                                  color:
                                  AppColors.lightGreen,
                                  borderRadius:
                                  BorderRadius.circular(
                                      5),
                                  border: Border.all(
                                      color: AppColors
                                          .primary)),
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                    color:
                                    AppColors.primary,
                                  ),
                                  onPressed: () {
                                    cubit.increaseQuantity(product!);
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              width: 7.7.w,
                              height: 3.8.h,
                              decoration: BoxDecoration(
                                  color:
                                  AppColors.lightGreen,
                                  borderRadius:
                                  BorderRadius.circular(
                                      5)),
                              child: Text(
                                  "${product?.quantity?.toInt().toString()}",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: AppColors
                                          .primary,
                                      fontSize: 12)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 7.w,
                              height: 3.3.h,
                              decoration: BoxDecoration(
                                  color:
                                  AppColors.lightGreen,
                                  borderRadius:
                                  BorderRadius.circular(
                                      5),
                                  border: Border.all(
                                      color: AppColors
                                          .primary)),
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                    color:
                                    AppColors.primary,
                                  ),
                                  onPressed: () {
                                    cubit.decreaseQuantity(product!,context);
                                  }),
                            ),
                            SizedBox(width: 15.w,),
                            Text("${product?.price}/${product?.unit}",
                                textDirection: TextDirection.ltr,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: AppColors.primary)),
                          ],
                        );
                      },
                    ),
                  ],
                ),


              ],
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              CartCubit cubit = context.read<CartCubit>();

              return Positioned(
                left: -10,
                top: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.red,
                    size: 15,
                  ),
                  onPressed: () {
                    cubit.removeItem(product?.id);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
