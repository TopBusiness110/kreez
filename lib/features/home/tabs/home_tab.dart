import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreez/core/utils/get_size.dart';
import 'package:kreez/core/widgets/banner.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/decoded_image.dart';
import '../../products/cubit/products_cubit.dart';
import '../../search_home/cubit/home_search_cubit.dart';
import '../components/home_product_item.dart';
import '../components/home_title_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getUserName();
    context.read<HomeCubit>().getAllProducts();
    context.read<HomeCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return state is LoadingAllProductsState
            ? Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ))
            : Stack(
          children: [
            SizedBox(
              //  height: 87.h,
              child: RefreshIndicator(
                onRefresh: () async {
                  await refreshData(context);
                },
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    // hello user
                    InkWell(
                      onTap: () {
                        // go to profile tab
                        context.read<HomeCubit>().changeFABLocation(0);
                        // context
                        //     .read<HomeCubit>()
                        //     .notchController
                        //     .jumpTo(0);
                        // cubit.currentIndex=2;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.gray,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "مرحبا , ${cubit.name ?? ""}",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                fontSize: 14,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //search
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            onTap: () {
                              context
                                  .read<HomeSearchCubit>()
                                  .productsByCategoryIdModel = null;
                              Navigator.pushNamed(
                                  context, Routes.homeSearchRoute);
                            },
                            prefixWidget: Icon(
                              Icons.search,
                              color: AppColors.primary,
                            ),
                            title: "search_product".tr(),
                            textInputType: TextInputType.text,
                            backgroundColor: AppColors.green1,
                            textColor: AppColors.gray,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10),
                            width: getSize(context) / 10,
                            height: getSize(context) / 10,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  ImageAssets.filterIcon,
                                  width: 10,
                                  height: 5,
                                ))),
                      ],
                    ),
                    BannerScreen(),

                    const SizedBox(
                      height: 10,
                    ),
                    //categories
                    HomeTitleItem(
                      title: "categories".tr(),
                      moreOnTap: () {
                        //   Navigator.pushNamed(context, Routes.categoriesRoute,arguments: cubit.allCategoriesModel);
                        Navigator.pushNamed(context, Routes.productsRoute,
                            arguments: [cubit.allCategoriesModel, 0]);
                      },
                    ),
                    //categories list
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: getSize(context) * 0.4,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getSize(context) / 30,
                          );
                        },
                        itemCount: cubit.allCategoriesModel?.count ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<ProductsCubit>()
                                  .getProductsByCategoryId(cubit
                                  .allCategoriesModel!
                                  .result![index]
                                  .id!);

                              //  Navigator.pushNamed(context, Routes.productsRoute,arguments: cubit.allCategoriesModel);
                              Navigator.pushNamed(
                                  context, Routes.productsRoute,
                                  arguments: [
                                    cubit.allCategoriesModel,
                                    cubit.allCategoriesModel
                                        ?.result?[index].id,
                                  ]);
                            },
                            child: Column(
                              children: [
                                DecodedImage(
                                    base64String: cubit.allCategoriesModel
                                        ?.result?[index].image1920,
                                    context: context),
                                Flexible(
                                  child: Container(
                                    width: getSize(context) / 4,
                                    child: Text(
                                      "${cubit.allCategoriesModel
                                          ?.result?[index].displayName}",
                                      textAlign: TextAlign.center,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          color: AppColors.black1,
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    //الأكثر مبيعا
                    HomeTitleItem(
                      title: "الأكثر مبيعا",
                      moreOnTap: () {
                        //  Navigator.pushNamed(context, Routes.productsRoute,arguments: cubit.allCategoriesModel);
                        Navigator.pushNamed(context, Routes.productsRoute,
                            arguments: [cubit.allCategoriesModel, 0]);
                      },
                    ),
                    //الأكثر مبيعا list

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: getSize(context) * 0.6,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getSize(context) * 0.1,
                          );
                        },
                        itemCount: cubit.allProductsModel?.count ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HomeProductItem2(
                            productModel: ProductModel(
                                id: cubit
                                    .allProductsModel?.result?[index].id,
                                price: cubit.allProductsModel
                                    ?.result?[index].listPrice,
                                name: cubit.allProductsModel
                                    ?.result?[index].name,
                                quantity: cubit.allProductsModel
                                    ?.result?[index].count ?? 0,
                                image: cubit.allProductsModel
                                    ?.result?[index].image1920,
                                description: cubit.allProductsModel
                                    ?.result?[index].descriptionSale,
                                ribbon: cubit.allProductsModel
                                    ?.result?[index].websiteRibbonId,
                                unit: cubit.allProductsModel
                                    ?.result?[index].uomName),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: getSize(context) * 0.07),
                        child: Image.asset(ImageAssets.homeSaleImage)),

                    // المنتجات
                    HomeTitleItem(
                        title: " المنتجات",
                        moreOnTap: () {
                          //  Navigator.pushNamed(context, Routes.productsRoute,arguments: cubit.allCategoriesModel);
                          Navigator.pushNamed(
                              context, Routes.productsRoute,
                              arguments: [cubit.allCategoriesModel, 0]);
                        }),
                    // المنتجاتlist
                    (state is LoadingAllProductsState)
                        ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ))
                        : Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12),
                      height: getSize(context) * 0.6,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getSize(context) * 0.09,
                          );
                        },
                        itemCount:
                        cubit.allProductsModel?.count ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HomeProductItem2(
                              productModel: ProductModel(
                                  id: cubit.allProductsModel
                                      ?.result?[index].id,
                                  price: cubit.allProductsModel
                                      ?.result?[index].listPrice,
                                  name: cubit.allProductsModel
                                      ?.result?[index].name,
                                  quantity: 0,
                                  image: cubit.allProductsModel
                                      ?.result?[index].image1920,
                                  description: cubit
                                      .allProductsModel
                                      ?.result?[index]
                                      .descriptionSale,
                                  ribbon: cubit
                                      .allProductsModel
                                      ?.result?[index]
                                      .websiteRibbonId,
                                  unit: cubit.allProductsModel
                                      ?.result?[index].uomName));
                        },
                      ),
                    ),

                    HomeTitleItem(
                      title: " أحدث منتجات",
                      moreOnTap: () {
                        // Navigator.pushNamed(context, Routes.productsRoute,arguments: cubit.allCategoriesModel);
                        Navigator.pushNamed(context, Routes.productsRoute,
                            arguments: [cubit.allCategoriesModel, 0]);
                      },
                    ),
                    (state is LoadingAllProductsState)
                        ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ))
                        : Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12),
                      height: getSize(context) * 0.6,
                      child: ListView.separated(
                        reverse: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: getSize(context) * 0.09,
                          );
                        },
                        itemCount:
                        cubit.allProductsModel?.count ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HomeProductItem2(
                              productModel: ProductModel(
                                  id: cubit.allProductsModel
                                      ?.result?[index].id,
                                  price: cubit.allProductsModel
                                      ?.result?[index].listPrice,
                                  name: cubit.allProductsModel
                                      ?.result?[index].name,
                                  quantity: 0,
                                  image: cubit.allProductsModel
                                      ?.result?[index].image1920,
                                  description: cubit
                                      .allProductsModel
                                      ?.result?[index]
                                      .descriptionSale,
                                  ribbon: cubit
                                      .allProductsModel
                                      ?.result?[index]
                                      .websiteRibbonId,
                                  unit: cubit.allProductsModel
                                      ?.result?[index].uomName));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   right: 0,
            //     bottom: 0,
            //     child: InkWell(
            //       onTap: () {
            //
            //       },
            //       child: CircleAvatar(
            //         radius: 30,
            //         backgroundColor: AppColors.primary,
            //         child: Icon(Icons.add,size: 35,color: AppColors.white,),
            //
            //       ),
            //     ))
          ],
        );
      },
    );
  }

  Future<void> refreshData(BuildContext context) async {
    await context.read<HomeCubit>().getAllCategories();
    await context.read<HomeCubit>().getAllProducts();

    // Fetch new data or update existing data
    // Replace this with your actual data-fetching logic
    // For example, you can make an API call here or update a local database
  }
}
