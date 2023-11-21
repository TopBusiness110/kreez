import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  String image,title,description;

//Constructor created
  CustomSlider({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      //  color: Colors.lightBlue,
      // column containing image
      // title and description
      child: Column(
        mainAxisSize: MainAxisSize.min,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image(
            image: AssetImage(image),
          //  width: width*0.99,height: height*0.55,
            fit: BoxFit.fill,)),
          //SizedBox(height: height*0.05),
          Text(title, style: Theme.of(context).textTheme.displayLarge),
         // SizedBox(height: height*0.05),
          Text(description,style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
       //   SizedBox(height: height*0.05),

        ],
      ),
    );
  }
}

