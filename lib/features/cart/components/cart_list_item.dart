import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';

import '../../../core/models/all_products_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/get_size.dart';
import '../../../core/widgets/decoded_image.dart';
import '../../product_details/models/product_model.dart';

class CartListItem extends StatelessWidget {
  final ProductModel? product;

  const CartListItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8 ),
      // margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(1, 3))
        ],
      ),
      child: Stack(
        children: [
          Card(        color: Colors.white,
            child: Row(
              //  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              children: [
                //image
                Flexible(
                  child: SizedBox(
                      // width: 14.w,
                      child: DecodedImage2(
                    base64String: product?.image,
                  )),
                ),
                //Image.asset("assets/images/strawberry.png",),
                const SizedBox(
                  width: 10,
                ),
                Container( color: Colors.transparent,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product?.name}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.black1)),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          CartCubit cubit = context.read<CartCubit>();
                          return Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // add btn
                              Container(
                                alignment: Alignment.center,
                                width: getSize(context) * 0.1,
                                height: getSize(context) * 0.1,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColors.primary)),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: AppColors.primary,
                                    ),
                                    onPressed: () async {
                                      await cubit.increaseQuantity(product!,context);
                                      print("****************************");
                                    }),
                              ),
                              // quantity
                              Container(
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                width: getSize(context) * 0.1,
                                height: getSize(context) * 0.1,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                    "${product?.quantity}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColors.primary,
                                            fontSize: 12)),
                              ),
                              // remove btn
                              Container(
                                alignment: Alignment.center,
                                width: getSize(context) * 0.1,
                                height: getSize(context) * 0.1,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColors.primary)),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: AppColors.primary,
                                    ),
                                    onPressed: () {
                                      cubit.decreaseQuantity(product!, context);
                                    }),
                              ),

                              SizedBox(
                                width: getSize(context) * 0.15,
                              ),
                              //unit
                              Text("${product?.price}/${product?.unit}",
                                  textDirection: TextDirection.ltr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.primary)),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
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
