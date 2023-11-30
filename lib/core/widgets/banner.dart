import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';
import '../utils/get_size.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}
int sliderCurrentIndex = 0;
final List<String> sliderImageList = [
  ImageAssets.homeSlider1Image,
  ImageAssets.homeSlider2Image,
  ImageAssets.homeSlider1Image,
];
class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        CarouselSlider(
          items: sliderImageList.map((image) {
            return Container(
              padding: EdgeInsets.all(4),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            // pauseAutoPlayInFiniteScroll: true,
            // pauseAutoPlayOnManualNavigate: true,
            // pauseAutoPlayOnTouch: true,
            height: getSize(context) * 0.2,
            viewportFraction: 1,
            initialPage: 0,
            // enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
          setState(() {
            sliderCurrentIndex = index;
          });

              // changeDotsIndicator(index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: sliderImageList.length,
          position: sliderCurrentIndex,
          decorator: DotsDecorator(
            size: const Size(9, 9),
            activeSize: const Size(12, 12),
            spacing: const EdgeInsets.all(2),
            color: AppColors.gray1, // Inactive color
            activeColor: AppColors.primary,
          ),
        )
      ],
    );
  }
}

