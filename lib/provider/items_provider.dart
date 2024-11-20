import 'package:flutter/material.dart';
import '../repos/products_repo.dart';

class CoffeeItemProvider extends ChangeNotifier {

  final List<CoffeeItem> _coffeeItems = [
    CoffeeItem(
      name: 'Espresso',
      price: 3.99,
      imageUrl: 'assets/images/coffee1.png',
      isLiked: false,
      description: 'Espresso is the heart of many coffee drinks, delivering a concentrated and rich shot of coffee in a small amount. This drink is perfect for those who seek a bold and quick caffeine boost. Made by forcing hot water under pressure through finely-ground coffee beans, espresso is intensely flavored and offers a deep, full-bodied taste. It’s enjoyed by coffee lovers around the world, either as a standalone shot or as the base for drinks like lattes, cappuccinos, and Americanos. Espresso is ideal for those who appreciate the complexity and strength of coffee in its purest form. The taste is robust, with hints of caramel and dark chocolate, and its velvety crema adds to its luxurious experience. A perfect pick-me-up for any time of day.',
      rating: 4.7,
      type: 'Espresso',
      flavor: 'Classic',
      brewTime: '2 minutes',
      gradientColors: [const Color(0xffbfdf7a), const Color(0xff75309b)], // Espresso gradient colors
    ),
    CoffeeItem(
      name: 'Latte',
      price: 4.50,
      imageUrl: 'assets/images/coffee2.png',
      isLiked: true,
      description: 'A latte is a smooth and creamy coffee drink made with espresso and steamed milk, topped with a small layer of foam. This drink is a favorite among coffee lovers who enjoy a rich, velvety texture. Lattes are versatile and can be flavored with syrups such as vanilla, caramel, hazelnut, and more, adding a personalized touch to each cup. They offer a balanced flavor profile, where the espresso’s boldness is softened by the milk, creating a smooth and satisfying drink. Lattes are perfect for anyone looking for a comforting, indulgent coffee experience. They can be enjoyed hot or iced, and they make a perfect morning drink or an afternoon pick-me-up. With their creamy texture and subtle sweetness, lattes are popular for both casual coffee drinkers and serious aficionados alike.',
      rating: 4.8,
      type: 'Latte',
      flavor: 'Vanilla',
      brewTime: '5 minutes',
      gradientColors: [const Color(0xffa81d22), const Color(0xff8c3a85)],
    ),
    CoffeeItem(
      name: 'Cappuccino',
      price: 4.20,
      imageUrl: 'assets/images/coffee3.png',
      isLiked: true,
      description: 'Cappuccino is a traditional Italian coffee drink that combines equal parts espresso, steamed milk, and foam, offering a rich and frothy experience. Its velvety texture and balanced taste make it one of the most popular coffee drinks in the world. Cappuccinos are typically enjoyed in the morning as a hearty breakfast beverage, although they can be consumed throughout the day. The drink’s espresso base gives it a strong flavor, while the creamy milk and foam add softness and sweetness. With its frothy top, cappuccino is often dusted with cocoa powder or cinnamon for an extra touch of flavor. It’s a perfect choice for those who enjoy a luxurious and creamy coffee experience with a bit of boldness. Whether you prefer it hot or iced, cappuccino is a timeless choice for any coffee lover.',
      rating: 4.6,
      type: 'Cappuccino',
      flavor: 'Hazelnut',
      brewTime: '4 minutes',
      gradientColors: [const Color(0xfffdc111), const Color(0xff896910)], // Cappuccino gradient colors
    ),
    CoffeeItem(
      name: 'Mocha',
      price: 4.75,
      imageUrl: 'assets/images/coffee4.png',
      isLiked: false,
      description: 'Mocha is a delicious blend of rich espresso, steamed milk, and chocolate syrup, offering a perfect balance of coffee and cocoa flavors. The drink is perfect for those who love both coffee and chocolate, making it a popular choice among coffee drinkers with a sweet tooth. Mocha coffee drinks are usually topped with whipped cream and a drizzle of chocolate sauce for an extra indulgent experience. Whether you prefer your mocha hot or iced, it provides a rich, creamy texture and a deeply satisfying taste. The addition of chocolate adds a luxurious twist to the classic espresso flavor, making it a perfect treat for any time of day. Whether enjoyed as a morning pick-me-up or an afternoon dessert drink, mocha will satisfy both coffee and chocolate cravings.',
      rating: 4.5,
      type: 'Mocha',
      flavor: 'Chocolate',
      brewTime: '5 minutes',
      gradientColors: [const Color(0xff3d6f72), const Color(0xffdbe0dc)], // Mocha gradient colors
    ),
    CoffeeItem(
      name: 'Americano',
      price: 3.50,
      imageUrl: 'assets/images/coffee5.png',
      isLiked: true,
      description: 'An Americano is a simple yet satisfying coffee drink made by diluting espresso with hot water, resulting in a rich and smooth coffee flavor. It’s a great choice for those who love the robust taste of espresso but prefer a less intense flavor. The Americano is perfect for anyone who wants a traditional coffee experience without the strong bitterness of pure espresso. It’s often served in a larger cup, offering a more casual coffee experience. Whether you enjoy it black or with a splash of milk, the Americano is a versatile and easy-to-drink coffee that can be enjoyed any time of the day. It’s the ideal choice for those who appreciate the boldness of espresso but want a more mellow and drinkable version.',
      rating: 4.4,
      type: 'Americano',
      flavor: 'Classic',
      brewTime: '3 minutes',
      gradientColors: [const Color(0xffa52f06), const Color(0xffef8865)], // Americano gradient colors
    ),
    CoffeeItem(
      name: 'Flat White',
      price: 4.25,
      imageUrl: 'assets/images/coffee6.png',
      isLiked: false,
      description: 'A flat white is a coffee drink that combines espresso and steamed milk with a velvety smooth texture. It’s similar to a latte, but with a higher ratio of espresso to milk, making it a bit stronger and less milky than a traditional latte. The flat white is a favorite among coffee enthusiasts who enjoy a stronger coffee flavor but still prefer the creamy, smooth texture. The drink’s smooth, velvety milk adds richness to the coffee, but it doesn’t overpower the espresso, allowing the bold flavors to shine through. Flat whites are perfect for those who want a balanced coffee experience that’s not too strong or too creamy. Whether you drink it hot or iced, flat whites are a great choice for those seeking a refined coffee experience.',
      rating: 4.3,
      type: 'Flat White',
      flavor: 'Plain',
      brewTime: '3 minutes',
      gradientColors: [const Color(0xffbe541b), const Color(0xffde9e72)],
    ),
  ];

  CoffeeItem _selectedItem= CoffeeItem(
    name: 'Espresso',
    price: 3.99,
    imageUrl: 'assets/images/coffee1.png',
    isLiked: false,
    description: 'Espresso is the heart of many coffee drinks, delivering a concentrated and rich shot of coffee in a small amount. This drink is perfect for those who seek a bold and quick caffeine boost. Made by forcing hot water under pressure through finely-ground coffee beans, espresso is intensely flavored and offers a deep, full-bodied taste. It’s enjoyed by coffee lovers around the world, either as a standalone shot or as the base for drinks like lattes, cappuccinos, and Americanos. Espresso is ideal for those who appreciate the complexity and strength of coffee in its purest form. The taste is robust, with hints of caramel and dark chocolate, and its velvety crema adds to its luxurious experience. A perfect pick-me-up for any time of day.',
    rating: 4.7,
    type: 'Espresso',
    flavor: 'Classic',
    brewTime: '2 minutes',
    gradientColors: [const Color(0xffbfdf7a), const Color(0xff75309b)],
  );  // Track the selected item

  List<CoffeeItem> get coffeeItems => _coffeeItems;

  CoffeeItem? get selectedItem => _selectedItem;

  // Set the selected item
  void setSelectedItem(CoffeeItem item) {
    _selectedItem = item;
    notifyListeners();  // Notify listeners when selection changes
  }

  // Update count for a CoffeeItem
  void updateCount(CoffeeItem coffeeItem, int newCount) {
    coffeeItem.count = newCount;
    notifyListeners();
  }

  // Toggle liked status
  void likeItem(CoffeeItem coffeeItem) {
    coffeeItem.isLiked = !coffeeItem.isLiked;
    notifyListeners();
  }


  String _selectedCategory = 'Donuts';

  final List<Map<String, dynamic>> donuts = [
    {
      'name': 'Pink in Disguise',
      'price': '\$3.55',
      'image': 'assets/images/donut1.png',
      'color': Colors.pink[100],
    },
    {
      'name': 'Baked Blueberry',
      'price': '\$3.55',
      'image': 'assets/images/donut2.png',
      'color': Colors.blue[100],
    },
    {
      'name': 'Glaze Party',
      'price': '\$3.55',
      'image': 'assets/images/donut3.png',
      'color': Colors.purple[100],
    },
  ];

  final List<Map<String, dynamic>> drinks = [
    {
      'name': 'Expresso',
      'price': '\$2.50',
      'image': 'assets/images/coffee1.png',
      'color': Colors.green[100],
    },
    {
      'name': 'Cappuccino',
      'price': '\$2.00',
      'image': 'assets/images/coffee3.png',
      'color': Colors.yellow[100],
    },
  ];



  // Getter for the selected category
  String get selectedCategory => _selectedCategory;

  // Getter for the items based on the selected category
  List<Map<String, dynamic>> get items {
    return _selectedCategory == 'Donuts' ? donuts : drinks;
  }

  // Method to switch between categories
  void switchCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

}
