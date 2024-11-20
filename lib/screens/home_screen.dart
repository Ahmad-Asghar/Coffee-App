import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/items_provider.dart';
import '../widgets/app_text.dart';
import '../widgets/lamp_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<String> categories = ['Drinks', 'Donuts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<CoffeeItemProvider>(
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
                        colors: coffeeProvider.selectedItem!.gradientColors,
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
                  Padding(
                    padding:  EdgeInsets.only(top: 5.h),
                    child: CarouselSlider.builder(
                      itemCount: coffeeProvider.coffeeItems.length,
                      itemBuilder: (context, index, realIndex) {
                        GlobalKey key = GlobalKey();
                        return FadeInUp(
                          child: CoffeeItemCard(
                            lampItemProvider: coffeeProvider,
                            index: index,
                            globalKey: key,
                            lamp: coffeeProvider.coffeeItems[index],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index,reason){
                          coffeeProvider.setSelectedItem(coffeeProvider.coffeeItems[index]);
                        },
                        height: MediaQuery.of(context).size.height * 0.72,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 0.65,

                      ),
                    ),
                  ),
                 Column(
                   children: [
                     SizedBox(height: 60.h),
                     SizedBox(
                         height: 40.h,
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: List.generate(
                               categories.length,
                                   (index) {
                                 String category = categories[index];
                                 return GestureDetector(
                                   onTap: () => coffeeProvider.switchCategory(category),
                                   child: AnimatedContainer(
                                     duration: const Duration(milliseconds: 400),
                                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                     decoration: BoxDecoration(
                                       color: coffeeProvider.selectedCategory == category ? Colors.orange : Colors.transparent,
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     child: CustomTextWidget(
                                       title: category,
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: coffeeProvider.selectedCategory == category ? Colors.black : Colors.white,
                                     ),
                                   ),
                                 );
                               },
                             ),
                           ),
                           Expanded(
                             child: ListView.builder(
                               padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                               itemCount: coffeeProvider.items.length,
                               itemBuilder: (context, index) {
                                 final item = coffeeProvider.items[index];
                                 return Padding(
                                   padding: const EdgeInsets.only(bottom: 5),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Container(
                                         height: 80,
                                         width: 80,
                                         decoration:  BoxDecoration(
                                             color: item['color']!,
                                           borderRadius: const BorderRadius.only(
                                             topLeft: Radius.circular(15),
                                             bottomLeft: Radius.circular(15),
                                           )
                                         ),
                                         child: Padding(
                                           padding: const EdgeInsets.all(13.0),
                                           child: Image.asset(item['image']!),
                                         ),
                                       ),
                                       const SizedBox(width: 10,),
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           CustomTextWidget(
                                             title: item['name']!,
                                             color: Colors.white,
                                             fontSize: 18.sp,
                                             fontWeight: FontWeight.w600,
                                           ),
                                           const SizedBox(height: 5),
                                           // Subtitle text (price)
                                           CustomTextWidget(
                                             title: item['price']!,
                                             color: Colors.orange,
                                             fontSize: 17.sp,
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 );
                               },
                             ),
                           ),
                         ],
                       ),

                     )
                   ],
                 )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
