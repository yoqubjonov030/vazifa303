import 'package:flutter/cupertino.dart';

class OnBoardingImages extends StatelessWidget {
  const OnBoardingImages(
      {super.key,
        required this.image,
        required this.image2,
        required this.image3,
        required this.image4,
        required this.image5,
        required this.image6});

  final String image, image2, image3, image4, image5, image6;

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              width: 166,
              height: 167,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image2,
              width: 166,
              height: 167,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image3,
              width: 166,
              height: 167,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image4,
              width: 166,
              height: 167,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image5,
              width: 166,
              height: 167,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image6,
              width: 166,
              height: 167,
            ),
          ),
        ]);
  }
}