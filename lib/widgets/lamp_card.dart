import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/animated_route_provider.dart';
import '../provider/items_provider.dart';
import '../repos/products_repo.dart';
import '../screens/details_screen.dart';
import 'app_text.dart';

class CoffeeItemCard extends StatelessWidget {
  final CoffeeItemProvider lampItemProvider;
  final int index;
  final CoffeeItem lamp;
  final GlobalKey globalKey;

  const CoffeeItemCard({
    super.key,
    required this.lamp,
    required this.globalKey,
    required this.index,
    required this.lampItemProvider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final offset = renderBox.localToGlobal(Offset.zero);
        Navigator.of(context).push(createRoute(
          DetailsScreen(
            index: index,
            startSize: size,
            startPosition: offset,
          ),
        ));
      },
      child: SizedBox(
        height: 65.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 45.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  key: globalKey,
                  lamp.imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: lamp.name,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                  fontSize: 20.sp,
                ),
                const SizedBox(height: 6),
                CustomTextWidget(
                  title: '\$${lamp.price.toString()}',
                  color: const Color(0xfffa5a04),
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
