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
import 'home_screen.dart';


class CartScreen extends StatelessWidget {
  final int index;
  final Size startSize;
  final Offset startPosition;

  const CartScreen({super.key, required this.index, required this.startSize, required this.startPosition});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = MediaQuery.of(context).size.width * 0.5;
    final endPosition = Offset(
      (screenWidth - imageWidth) / 2, 13.h,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<CoffeeItemProvider>(builder: (context, lampProvider, _) {
        return CustomAnimatedContainer(
            curve: Curves.easeIn,
            startSize: startSize,
            startPosition: startPosition,
            endSize: Size(imageWidth, MediaQuery.of(context).size.height * 0.35),
            endPosition: endPosition,
            builder: (context, size, position, animationCompleted, onReturn) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 6.h),
                        FadeIn(
                          animate: animationCompleted,
                          child: CustomTextWidget(
                              title: 'My Cart',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 6.w),
                        ),
                        SizedBox(height: 17.h),
                        FadeIn(
                          animate: animationCompleted,
                          child: Container(
                            height: 38.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(colors: lampProvider.coffeeItems[index].gradientColors),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 24.h),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 6.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: lampProvider.coffeeItems[index].name,fontWeight: FontWeight.w600,fontSize: 6.w),
                                      SizedBox(height: 0.3.h,),
                                      CustomTextWidget(title: '\$${lampProvider.coffeeItems[index].price}'.toString(),color: Colors.white,fontSize: 5.w,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if(lampProvider.coffeeItems[index].count>1){
                                                lampProvider.updateCount(lampProvider.coffeeItems[index], lampProvider.coffeeItems[index].count-1);

                                              }
                                            },
                                            child: Container(
                                              height: 8.w,
                                              width: 8.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color:Color(0xff4d4672)),
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
                                            value: lampProvider.coffeeItems[index].count,
                                            duration: const Duration(milliseconds: 700),
                                            textStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 4.7.w,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              lampProvider.updateCount(lampProvider.coffeeItems[index], lampProvider.coffeeItems[index].count+1);
                                            },
                                            child: Container(
                                              height: 8.w,
                                              width: 8.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Color(0xff4d4672)),
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
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        ZoomIn(
                          animate: animationCompleted,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xfff2f2f2),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(title: 'Total',fontSize: 4.5.w,color: Colors.blueGrey,),
                                      AnimatedFlipCounter(
                                        value: lampProvider.coffeeItems[index].price*lampProvider.coffeeItems[index].count,
                                          prefix: '\$',
                                        duration: const Duration(milliseconds: 600),
                                        textStyle: GoogleFonts.poppins(
                                          fontSize: 4.5.w,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ),
                    
                                    ],
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(title: 'VAT',fontSize: 4.5.w,color: Colors.blueGrey,),
                                      CustomTextWidget(title: "\$5",fontSize: 4.5.w,color: Colors.blueGrey,fontWeight: FontWeight.bold,),
                    
                                    ],
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(title: 'Delivery Fee',fontSize: 4.5.w,color: Colors.blueGrey,),
                                      CustomTextWidget(title: "Free",fontSize: 4.5.w,color: Colors.blueGrey,fontWeight: FontWeight.bold,),
                    
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Divider(height: 0,color: Colors.blueGrey.withOpacity(0.6)),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(title: 'Sub Total',fontSize: 4.5.w,),
                                      AnimatedFlipCounter(
                                          value: ((lampProvider.coffeeItems[index].price*lampProvider.coffeeItems[index].count)+5),
                                          prefix: '\$',
                                          duration: const Duration(milliseconds: 600),
                                          textStyle: GoogleFonts.poppins(
                                            fontSize: 4.5.w,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        ZoomIn(
                          animate: animationCompleted,
                          child: Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      shadowColor: Colors.transparent,
                                      backgroundColor: const Color(0xff4d4672),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      minimumSize: Size(double.infinity, 7.h),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, createRoute(const HomeScreen()));
                                    },
                                    child: CustomTextWidget(
                                      title: 'Check Out',
                                      fontSize: 4.5.w,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: position.dx,
                  top: position.dy,
                  width: size.width,
                  height: size.height,
                    child: Image.asset(
                      lampProvider.coffeeItems[index].imageUrl,
                    ),
                ),
              ],
            );
          }
        );
      }),
    );
  }
}
