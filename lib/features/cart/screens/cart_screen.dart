// import 'package:easy_localization/easy_localization.dart' as easy;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kreez/core/utils/get_size.dart';
// import 'package:kreez/core/widgets/decoded_image.dart';
// import 'package:kreez/features/cart/cubit/cart_cubit.dart';
// import 'package:kreez/features/product_details/models/product_model.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../config/routes/app_routes.dart';
// import '../../../core/preferences/preferences.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_textfield.dart';
// import '../components/cart_list_item.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String? lang = easy.EasyLocalization.of(context)?.locale.countryCode;
//
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         CartCubit cubit = context.read<CartCubit>();
//         return Container(
//           color: Colors.white,
//           margin: EdgeInsets.only(top: getSize(context)/14),
//           child:
//         // SingleChildScrollView(
//         //       physics: NeverScrollableScrollPhysics(),
//         //       child:
//               Container(
//                   // color: Colors.lightBlue,
//                   height: 88.h,
//                   child: Column(
//                     children: [
//                       //appbar
//                       Container(
//                         width: double.infinity,
//                         height: 15.h,
//                         decoration: BoxDecoration(
//                             color: AppColors.green,
//                             borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20))),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 0.1.h,
//                             ),
//                             //مرحبا
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 22,
//                                     backgroundColor: AppColors.white,
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 40,
//                                       color: AppColors.gray1,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                   Text("مرحبا , ${cubit.name ?? ""}",
//                                       style:
//                                           Theme.of(context).textTheme.bodySmall),
//                                 ],
//                               ),
//                             ),
//                             //cart text
//                             Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("cart".tr(),
//                                     style: Theme.of(context).textTheme.bodyLarge),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       cubit.cart.isNotEmpty?
//                       Expanded(
//                         child: ListView.builder(
//                           physics: AlwaysScrollableScrollPhysics(),
//                           itemCount: context.read<CartCubit>().cart.length,
//                           itemBuilder: (context, index) {
//                             var key = context
//                                 .read<CartCubit>()
//                                 .cart
//                                 .keys
//                                 .elementAt(index);
//                             ProductModel? product =
//                                 context.read<CartCubit>().cart[key];
//                             return CartListItem(
//                               product: product,
//                             );
//                           },
//                         ),
//                       ):
//                       Column(
//                         children: [
//                           SizedBox(height: getSize(context)/3,),
//                           Center(child: Image.asset("assets/images/4.jpg",width: getSize(context)/2,)),
//                           Text("cart_empty".tr(),style: TextStyle(color: AppColors.primary),)
//                         ],
//                       ),
//                       //confirm button
//
//                       // confirm btn
//                       cubit.cart.isNotEmpty?
//                       Container(
//                         padding: EdgeInsets.all(1),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border:
//                                 Border.all(color: AppColors.primary, width: 1.5)),
//                         child: CustomButton(
//                             width: 70.w,
//                             backgroundColor: AppColors.white,
//                             textColor: AppColors.primary,
//                             text: "confirm".tr(),
//                             onPressed: () async {
//                               if (cubit.cart.isNotEmpty) {
//                                 await cubit.createSaleOrder();
//                                 int? orderId =
//                                     await Preferences.instance.getSaleOrder();
//                                 cubit.cart.forEach((key, value) async {
//                                   await cubit.createSaleOrderLines(context,
//                                       saleOrderId: orderId!,
//                                       productId: key,
//                                       productName: value.name ?? "",
//                                       productQuantity: value.quantity ?? 0);
//                                 });
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(" Cart Is Empty !"),
//                                     behavior: SnackBarBehavior.floating,
//                                     margin: EdgeInsets.only(
//                                       bottom:  getSize(context)*1.5,
//                                       left: 10,
//                                       right: 10,
//                                     ) ,
//                                     duration: Duration(milliseconds: 1000),
//                                   ),
//                                 );
//                               }
//                             }),
//                       ):SizedBox(),
//
//                       SizedBox(
//                         height: 5.h,
//                       )
//                     ],
//                   )),
//           //),
//         );
//       },
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/utils/get_size.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../components/cart_list_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? lang = easy.EasyLocalization.of(context)?.locale.countryCode;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = context.read<CartCubit>();
        return SafeArea(
          child: Container(
            color: Colors.white,
           // margin: EdgeInsets.only(top: getSize(context)/14),
            child:
            Container(
               // height: getSize(context)*1.4,
                child: Column(
                  children: [
                    //appbar
                    Container(
                      width: double.infinity,
                      height: getSize(context)*0.33,
                      decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: getSize(context)*0.04,
                          ),
                          //مرحبا
                          InkWell(
                            onTap: () {
                              //todo=> go to profile tab
                              context.read<HomeCubit>().changeFABLocation(0);
                              context.read<HomeCubit>().notchController.jumpTo(0);
          
                            },
                            child: Padding(
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
                    state is CartSuccessState||cubit.cart1.isNotEmpty?
          
                    //state is CartSuccessState?
                    Expanded(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                       // itemCount: context.read<CartCubit>().cart.length,
                        itemCount:  context.read<CartCubit>().cart1?.length,
                        itemBuilder: (context, index) {
                          var key = context.read<CartCubit>().cart1?.keys.elementAt(index);
                          ProductModel? product = context.read<CartCubit>().cart1?[key];
                          return CartListItem(
                            product: product,
                          );
                        },
                      ),
                    ):
                    Expanded(
                      child: Column(
                        children: [
                         // SizedBox(height: getSize(context)/7,),
                          Center(child: Image.asset("assets/images/4.jpg",width: getSize(context)/2,)),
                          Text("cart_empty".tr(),style: TextStyle(color: AppColors.primary),)
                        ],
                      ),
                    ),
          
                    // confirm btn
                    state is EmptyCartState?
                    SizedBox():
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                          Border.all(color: AppColors.primary, width: 1.5)),
                      child: CustomButton(
                          width: getSize(context)*0.7,
                          height:getSize(context)*0.1,
                          backgroundColor: AppColors.white,
                          textColor: AppColors.primary,
                          text: "confirm".tr(),
                          onPressed: () async {
                            if (cubit.cart1!.isNotEmpty) {
                              await cubit.createSaleOrder();
                              int? orderId = await Preferences.instance.getSaleOrder();
                              cubit.cart1?.forEach((key, value) async {
                                await cubit.createSaleOrderLines(context,
                                    saleOrderId: orderId!,
                                    productId: key,
                                    productName: value.name ?? "",
                                    productQuantity: value.quantity ?? 0);
                              });
                            }
                            else {
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
                      height: getSize(context)*0.19   ,
                    )
                  ],
                )),
            //),
          ),
        );
      },
    );
  }
}

