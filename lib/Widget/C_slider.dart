import 'package:carousel_slider/carousel_slider.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:flutter/material.dart';

class C_Slider extends StatelessWidget {
  // image slide ka jo code ta o ye he

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: image.length,
      itemBuilder: (BuildContext context, int index, int pageviewIndex) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // niche cachednetworkprovider cache me pic store karta he take bar bar load na ho ,(ye us wakt jab net see image karna ho)
                  child: Image.asset(
                    image[index].image,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54.withOpacity(0.3),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      image[index].text,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.82,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true),
    );
  }
}
