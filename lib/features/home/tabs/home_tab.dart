import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/decoded_image.dart';
import '../components/home_product_item.dart';
import '../components/home_title_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return SizedBox(
          height: 87.h,
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
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
                      "مرحبا , محمد",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 12,),
                  Expanded(
                    child: CustomTextField(

                      prefixWidget: Icon(Icons.search,color: AppColors.primary,),
                      title: "search_product".tr(),
                      textInputType: TextInputType.text,
                      backgroundColor: AppColors.green1,
                      textColor: AppColors.gray,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 50,
                      height: 40,
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
              CarouselSlider(
                items: cubit.sliderImageList.map((image) {
                  return Container(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  pauseAutoPlayInFiniteScroll: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayOnTouch: true,
                  height: 15.h,
                  viewportFraction: 1,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                   // cubit.changeDotsIndicator(index);
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: cubit.sliderCurrentIndex,
                decorator:  DotsDecorator(
                  size: const Size(9,9),
                  activeSize:const Size(12,12),
                  spacing: const EdgeInsets.all(2),
                  color:AppColors.gray1, // Inactive color
                  activeColor: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10,),

              const HomeTitleItem(title: "التصنيفات",),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 18.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 3.w,);
                  },
                  itemCount:cubit.allCategoriesModel?.count??0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // CircleAvatar(
                        //   radius:50,
                        //     backgroundColor: AppColors.primary,
                        //     child: CircleAvatar(
                        //         radius:48,
                        //         backgroundColor: AppColors.white,
                        //         child: Image.asset(ImageAssets.strawberryImage,height: 10.h,))),
                        DecodedImage(base64String:cubit.allCategoriesModel?.result?[index].image1920 ),
                        Text("${cubit.allCategoriesModel?.result?[index].displayName}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black1,
                          fontSize: 15
                        ),)
                      ],
                    );
                  },),
              ),


              const HomeTitleItem(title: "الأكثر مبيعا",),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 26.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 5.w,);
                  },
                  itemCount: cubit.allProductsModel?.count??0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductItem(inSale: cubit.allProductsModel?.result?[index].websiteRibbonId,
                      productName: cubit.allProductsModel?.result?[index].name,
                      image:cubit.allProductsModel?.result?[index].image1920,
                      price: cubit.allProductsModel?.result?[index].listPrice,
                      unit:cubit.allProductsModel?.result?[index].uomName ,);
                },),
              ),

              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                  child: Image.asset(ImageAssets.homeSaleImage)),


             const  HomeTitleItem(title: " المنتجات",),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 26.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 5.w,);
                  },
                  itemCount: cubit.allProductsModel?.count??0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductItem(inSale: cubit.allProductsModel?.result?[index].websiteRibbonId,
                                     productName: cubit.allProductsModel?.result?[index].name,
                    image:cubit.allProductsModel?.result?[index].image1920,
                        price: cubit.allProductsModel?.result?[index].listPrice,
                        unit:cubit.allProductsModel?.result?[index].uomName ,);
                  },),
              ),

              const  HomeTitleItem(title: " أحدث منتجات",),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 26.h,
                child: ListView.separated(
                  reverse: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 5.w,);
                  },
                  itemCount: cubit.allProductsModel?.count??0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeProductItem(inSale: cubit.allProductsModel?.result?[index].websiteRibbonId,
                      productName: cubit.allProductsModel?.result?[index].name,
                      image:cubit.allProductsModel?.result?[index].image1920,
                      price: cubit.allProductsModel?.result?[index].listPrice,
                      unit:cubit.allProductsModel?.result?[index].uomName ,);
                  },),
              ),

            ],
          ),
        );
      },
    );
  }
}
