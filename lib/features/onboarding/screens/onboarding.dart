import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreez/core/utils/app_colors.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/models/slider_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/copyright.dart';
import '../coponents/slider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController controller = PageController(initialPage: 0);
  // @override
  // void dispose(){
  //   controller.dispose();
  //   super.dispose();
  // }
  @override
  void initState() {
  //controller = PageController(initialPage: 0);
  slides.add(SliderModel(sliderText: "التطبيق الاول الذى يربط بين  العميل والبائع داخل وخارج البلاد",
      sliderImage: ImageAssets.onboarding1Image, sliderTitle: "our_app".tr()));
  slides.add(SliderModel(sliderText: "التطبيق الاول الذى يربط بين  العميل والبائع داخل وخارج البلاد",
      sliderImage: ImageAssets.onboarding2Image, sliderTitle: "our_app".tr()));
  slides.add(SliderModel(sliderText: "التطبيق الاول الذى يربط بين  العميل والبائع داخل وخارج البلاد",
      sliderImage: ImageAssets.onboarding3Image, sliderTitle: "our_app".tr()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
    appBar: AppBar(
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary

      ),
    ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {

                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                return CustomSlider(title: slides[index].sliderTitle,description: slides[index].sliderText,image: slides[index].sliderImage,);
              },)
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) => buildDot(index, context))
            ),
          ),
          SizedBox(height: height*0.08,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              backgroundColor: AppColors.primary,
              minimumSize: Size(width*0.8, height*0.05)
            ),
            child: Text(
              currentIndex!=2?"next".tr():"start_now".tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onPressed: (){
              if(currentIndex ==2){
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              }

              else {
                controller.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeInCubic);
              }



            },
          ),
         SizedBox(height: height*0.01,),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
            child: Text(
              currentIndex!=2?"skip".tr():" ",style:Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.primary)
            ),
          ),
          SizedBox(height: height*0.05,),
          CopyrightWidget(width: width,)
      //  Image.asset(ImageAssets.copyrightSplashImage,width: width*0.4,height: 30,color: AppColors.gray,)


        ],
      ),
    );
  }
  // container created for dots
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 7,
      width: 8,
      margin: EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:currentIndex == index? AppColors.primary:AppColors.white2,
      ),
    );
  }
}
