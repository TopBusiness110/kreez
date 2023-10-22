import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/utils/get_size.dart';
import 'package:kreez/core/widgets/decoded_image.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../components/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? lang = easy.EasyLocalization.of(context)?.locale.countryCode;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = context.read<CartCubit>();
        return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
                // color: Colors.lightBlue,
                height: 88.h,
                child: Column(
                  children: [
                    //appbar
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.1.h,
                          ),
                          //مرحبا
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
                                Text("مرحبا , ${cubit.name ?? ""}",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          //cart text
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("cart".tr(),
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: context.read<CartCubit>().cart.length,
                        itemBuilder: (context, index) {
                          var key = context
                              .read<CartCubit>()
                              .cart
                              .keys
                              .elementAt(index);
                          ProductModel? product =
                              context.read<CartCubit>().cart[key];
                          return CartListItem(
                            product: product,
                          );
                        },
                      ),
                    ),
                    //confirm button

                    // confirm btn
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: AppColors.primary, width: 1.5)),
                      child: CustomButton(
                          width: 70.w,
                          backgroundColor: AppColors.white,
                          textColor: AppColors.primary,
                          text: "confirm".tr(),
                          onPressed: () async {
                            if (cubit.cart.isNotEmpty) {
                              await cubit.createSaleOrder();
                              int? orderId =
                                  await Preferences.instance.getSaleOrder();
                              cubit.cart.forEach((key, value) async {
                                await cubit.createSaleOrderLines(context,
                                    saleOrderId: orderId!,
                                    productId: key,
                                    productName: value.name ?? "",
                                    productQuantity: value.quantity ?? 0);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(" Cart Is Empty !"),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                    bottom:  getSize(context)*1.5,
                                    left: 10,
                                    right: 10,
                                  ) ,
                                  duration: Duration(milliseconds: 1000),
                                ),
                              );
                            }
                          }),
                    ),

                    SizedBox(
                      height: 5.h,
                    )
                  ],
                )));
      },
    );
  }
}
