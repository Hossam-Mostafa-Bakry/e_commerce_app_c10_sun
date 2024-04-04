import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderOffer extends StatefulWidget {
  CarouselSliderOffer({super.key});

  @override
  State<CarouselSliderOffer> createState() => _CarouselSliderOfferState();
}

class _CarouselSliderOfferState extends State<CarouselSliderOffer> {
  int activeIndex = 0;
  final List<String> urlImages = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      alignment: const Alignment(0.01, 0.8),
      children: [
        CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              String urlImage = urlImages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(urlImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/UP TO.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                              'assets/images/For all Headphones & AirPods.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset('assets/images/25% OFF.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text('Shop Now'),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            )),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: urlImages.length,
          effect:
              SlideEffect(dotWidth: 10, dotHeight: 10, dotColor: Colors.white),
        ),
      ],
    );
  }
}
