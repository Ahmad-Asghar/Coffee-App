import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/animated_route_provider.dart';
import '../provider/animation_builder.dart';
import '../provider/items_provider.dart';
import '../widgets/app_text.dart';
import '../widgets/rate_widget.dart';
import 'cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  final Size startSize;
  final Offset startPosition;

  const DetailsScreen(
      {super.key,
      required this.startSize,
      required this.startPosition,
      required this.index});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = MediaQuery.of(context).size.width * 0.5;
    final endPosition = Offset(
      (screenWidth - imageWidth) / 2, 8.h,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomAnimatedContainer(
        curve: Curves.easeIn,
        startSize: startSize,
        startPosition: startPosition,
        endSize: Size(imageWidth, MediaQuery.of(context).size.height * 0.25),
        endPosition: endPosition,
        builder: (context, size, position, animationCompleted, onReturn) {
          return Consumer<CoffeeItemProvider>(
              builder: (context, coffeeProvider, _) {
            return Stack(
              children: [
                Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 26.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: coffeeProvider.coffeeItems[index].gradientColors,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(1000),
                          bottomRight: Radius.circular(1000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: double.maxFinite,width: double.maxFinite,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur strength here
                        child: Container(
                          color: Colors.black.withOpacity(0), // Apply a transparent overlay
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            height: 40.h,
                       ),
                        FadeInUp(
                          animate: animationCompleted,
                          child: Container(
                            height: 60.h,
                            decoration:  BoxDecoration(
                                gradient: LinearGradient(colors:coffeeProvider.coffeeItems[index].gradientColors),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: double.infinity, height: 3.h),
                                  FadeIn(
                                      delay: const Duration(milliseconds: 700),
                                      animate: animationCompleted,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextWidget(
                                            title:
                                                coffeeProvider.coffeeItems[index].name,
                                            color: Colors.black,
                                            fontSize: 6.5.w,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if(coffeeProvider.coffeeItems[index].count>1){
                                                    coffeeProvider.updateCount(coffeeProvider.coffeeItems[index], coffeeProvider.coffeeItems[index].count-1);

                                                  }
                                                },
                                                child: Container(
                                                  height: 8.w,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: Colors.black),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 5.w,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              AnimatedFlipCounter(
                                                value: coffeeProvider.coffeeItems[index].count,
                                                duration: const Duration(milliseconds: 700),
                                                textStyle: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 4.7.w,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  coffeeProvider.updateCount(coffeeProvider.coffeeItems[index], coffeeProvider.coffeeItems[index].count+1);
                                                },
                                                child: Container(
                                                  height: 8.w,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: Colors.black),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 5.w,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  FadeIn(
                                      delay: const Duration(milliseconds: 1000),
                                      animate: animationCompleted,
                                      child:  RateWidget(
                                        value: coffeeProvider.coffeeItems[index].rating,
                                        color: coffeeProvider.coffeeItems[index].gradientColors[1],
                                      )),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  FadeIn(
                                      delay: const Duration(milliseconds: 1300),
                                      animate: animationCompleted,
                                      child: Row(
                                        children: [
                                          SlideInUp(
                                            from: 70,
                                            delay:
                                                const Duration(milliseconds: 1300),
                                            animate: animationCompleted,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6.h,
                                                  width: 6.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.5),
                                                    child: Icon(Icons.style_outlined),
                                                  ),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                CustomTextWidget(
                                                  title:
                                                      coffeeProvider.coffeeItems[index].type,
                                                  fontSize: 3.5.w,
                                                  color:
                                                      Colors.white.withOpacity(0.6),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          SlideInUp(
                                            from: 90,
                                            delay:
                                                const Duration(milliseconds: 1500),
                                            animate: animationCompleted,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6.h,
                                                  width: 6.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(12),
                                                    child: Icon(Icons.timelapse_rounded),
                                                  ),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                CustomTextWidget(
                                                  title:
                                                      "${coffeeProvider.coffeeItems[index].brewTime}",
                                                  fontSize: 3.5.w,
                                                  color:
                                                      Colors.white.withOpacity(0.6),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          SlideInUp(
                                            from: 110,
                                            delay:
                                                const Duration(milliseconds: 1700),
                                            animate: animationCompleted,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6.h,
                                                  width: 6.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(12),
                                                    child: Icon(Icons.flare_sharp),
                                                  ),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                CustomTextWidget(
                                                  title:
                                                      "${coffeeProvider.coffeeItems[index].flavor}",
                                                  fontSize: 3.5.w,
                                                  color:
                                                      Colors.white.withOpacity(0.6),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(height: 1.h),
                                  FadeIn(
                                      animate: animationCompleted,
                                      delay: const Duration(milliseconds: 2000),
                                      child: CustomTextWidget(
                                        title: coffeeProvider
                                            .coffeeItems[index].description,
                                        color: Colors.white,
                                         maxLines: 11,
                                      )),
                                  SizedBox(height: 3.h),
                                  FadeIn(
                                    animate: animationCompleted,
                                    delay: const Duration(milliseconds: 2300),
                                    child: Row(
                                      children: [
                                        AnimatedFlipCounter(
                                          prefix: '\$',
                                          value: coffeeProvider.coffeeItems[index].price * coffeeProvider.coffeeItems[index].count,
                                          duration: const Duration(milliseconds: 700),
                                          textStyle: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                            child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            minimumSize: Size(double.infinity, 6.h),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, createRoute( CartScreen(
                                                index: index,
                                              startSize: Size(imageWidth, MediaQuery.of(context).size.height * 0.25),
                                              startPosition: endPosition,
                                            )));
                                          },
                                          child: CustomTextWidget(
                                            title: 'Check Out',
                                            fontSize: 5.w,
                                            color: Colors.white,
                                          ),
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      left: position.dx,
                      top: position.dy,
                      child: Image.asset(
                        coffeeProvider.coffeeItems[index].imageUrl,
                        width: size.width,
                        height: size.height,
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
