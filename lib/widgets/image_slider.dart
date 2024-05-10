import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key}) : super(key: key);

  final List<String> imageUrls = [
    'https://graphicsfamily.com/wp-content/uploads/edd/2023/05/Website-Food-Banner-Design-scaled.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrp_PB-u88oE4Z3OfpSUEZ85aE4LAzX_0Y9pbmhj2xNg&s',
    'https://marketplace.canva.com/EAFloAOrGBY/1/0/1600w/canva-orange-and-black-minimalist-food-banner-landscape-hvZzaUttSLk.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
