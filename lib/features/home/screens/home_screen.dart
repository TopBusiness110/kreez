// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kreez/core/utils/app_colors.dart';
// import 'package:kreez/core/widgets/custom_textfield.dart';
// import 'package:kreez/features/home/cubit/home_cubit.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//      listener: (context, state) {
//
//       },
//
//      builder: (context, state) {
//     HomeCubit cubit = context.read<HomeCubit>();
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.primary,
//
//         onPressed: () {
//          // cubit.changeFABLocation(1);
//           // Add your FAB action here
//           cubit.selectedWidget = WidgetType.home;
//         },
//         child: Icon(cubit.icon ,color: AppColors.white,size: 30,),
//       ),
//       floatingActionButtonLocation:cubit.floatingActionButtonLocation,
//       bottomNavigationBar: ClipRRect(
//        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
//         child: BottomAppBar(
//           color: AppColors.primary,
//           shape: CircularNotchedRectangle(),
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 icon: Icon(cubit.rightIcon,color: AppColors.white,size: 30,),
//                 onPressed: () {
//                   // Add your navigation logic for the first icon here
//                   cubit.changeFABLocation(0);
//                   cubit.selectedWidget = WidgetType.cart;
//                 },
//               ),
//               IconButton(
//                 icon: Icon(cubit.leftIcon,color: AppColors.white,size: 30,),
//                 onPressed: () {
//                   cubit.changeFABLocation(2);
//                   cubit.selectedWidget = WidgetType.profile;
//                   // Add your navigation logic for the second icon here
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(Icons.person,color: AppColors.gray,),
//                   SizedBox(width: 15,),
//                   Text("مرحبا , محمد",style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                     fontSize: 14,
//                     color: AppColors.black
//                   ),)
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//
//                 Expanded(
//                   child: CustomTextField(
//                     prefixWidget: Icon(Icons.search),
//                       title: "search_product".tr(), textInputType: TextInputType.text,
//                       backgroundColor: AppColors.green1, textColor: AppColors.gray),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   width: 50,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(10)
//                   ),
//                   child: Icon(Icons.search,color: AppColors.white,size: 30,),
//                 ),
//               ],
//             ),
//              cubit.buildSelectedWidget()
//           ],
//         ),
//       ),
//     );
//   },
// );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/core/widgets/custom_textfield.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                cubit.selectedWidget = WidgetType.home;
                // Add your FAB action here
              },
              child: Icon(
                cubit.icon,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ),
          floatingActionButtonLocation: cubit.floatingActionButtonLocation,

          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primary,
              selectedItemColor: AppColors.white,
              unselectedItemColor: AppColors.gray,
              currentIndex: cubit.selectedIndex,
              onTap: (index) {
                cubit.changeFABLocation(index);
                switch (index) {
                  case 0:
                    cubit.selectedWidget = WidgetType.cart;
                    break;
                  case 1:
                    cubit.selectedWidget = WidgetType.home;
                    break;
                  case 2:
                    cubit.selectedWidget = WidgetType.profile;
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(cubit.rightIcon),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(cubit.leftIcon),
                  label: 'Profile',
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [

                cubit.buildSelectedWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}