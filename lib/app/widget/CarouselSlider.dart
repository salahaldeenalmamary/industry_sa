import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'custom_image_view.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final bool autoPlay;
  final double viewportFraction;

  const CustomCarouselSlider({
    Key? key,
    required this.imageUrls,
    this.height = 100.0,
    this.autoPlay = true,
    this.viewportFraction = 0.8,
  }) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: widget.imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CustomImageView(
                    imagePath: url,
                    height: widget.height,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: widget.height,
            autoPlay: widget.autoPlay,
            viewportFraction: widget.viewportFraction,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageUrls.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                
                },
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
