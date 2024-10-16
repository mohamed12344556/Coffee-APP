import '../../core/themes/app_colors.dart';
import '../../data/models/coffee_model.dart';
import '../../my_icons.dart';
import '../widgets/CoffeeCard.dart';
import '../widgets/CoffeeCategoryTab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  int selectedCategoryIndex = 0;
  int selectedIndex = 0;
  List<CoffeeModel> coffeeItems = [
    CoffeeModel(
      id: 1,
      name: 'Coffee Mocha',
      type: 'Deep Foam',
      price: 4.53,
      image: 'assets/images/2.png',
    ),
    CoffeeModel(
      id: 2,
      name: 'Flat White',
      type: 'Espresso',
      price: 3.53,
      image: 'assets/images/3.png',
    ),
    CoffeeModel(
      id: 3,
      name: 'Caffe Mocha',
      type: 'Deep Foam',
      price: 4.53,
      image: 'assets/images/4.png',
    ),
    CoffeeModel(
      id: 4,
      name: 'Flat White',
      type: 'Espresso',
      price: 3.53,
      image: 'assets/images/5.png',
    ),
    // Add more coffee items here
  ];

  void updateCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: const Color(0xFF1B1B1B),
                elevation: 0,
                toolbarHeight: 280,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffA2A2A2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          'Bilzen, Tanjungbalai',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          MyIcons
                              .type_regular__state_outline__library_arrow___down_2,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search coffee',
                              hintStyle:
                                  const TextStyle(color: Color(0xffA2A2A2)),
                              prefixIcon: const Icon(
                                MyIcons
                                    .type_regular__state_outline__library_search,
                                color: Colors.white,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xff2A2A2A),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              MyIcons
                                  .type_regular__state_outline__library_filter,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Promo Banner
            Positioned(
              top: 220,
              left: 20,
              right: 20,
              child: Container(
                height: 157,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/Banner1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 13,
                      right: 220,
                      child: Container(
                        height: 20,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xffED5151),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Promo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Buy one get\none FREE',
                            style: GoogleFonts.sora(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 380,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 20),

                  // Category Tabs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CoffeeCategoryTab(
                        title: 'All Coffee',
                        isSelected: selectedCategoryIndex == 0,
                        onTap: () => updateCategory(0),
                      ),
                      CoffeeCategoryTab(
                        title: 'Macchiato',
                        isSelected: selectedCategoryIndex == 1,
                        onTap: () => updateCategory(1),
                      ),
                      CoffeeCategoryTab(
                        title: 'Latte',
                        isSelected: selectedCategoryIndex == 2,
                        onTap: () => updateCategory(2),
                      ),
                      CoffeeCategoryTab(
                        title: 'Americano',
                        isSelected: selectedCategoryIndex == 3,
                        onTap: () => updateCategory(3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Coffee Cards
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: coffeeItems.length,
                    itemBuilder: (context, index) {
                      final coffee = coffeeItems[index];
                      return CoffeeCard(coffee: coffee);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: const Color(0xFF1B1B1B),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    MyIcons.type_regular__state_outline__library_home,
                    color: selectedIndex == 0 ? AppColors.orange : Colors.grey,
                  ),
                  if (selectedIndex == 0)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: AppColors.orange,
                    ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    MyIcons.type_regular__state_outline__library_heart,
                    color: selectedIndex == 1 ? AppColors.orange : Colors.grey,
                  ),
                  if (selectedIndex == 1)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: AppColors.orange,
                    ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    MyIcons.type_regular__state_outline__library_bag,
                    color: selectedIndex == 2 ? AppColors.orange : Colors.grey,
                  ),
                  if (selectedIndex == 2)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: AppColors.orange,
                    ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    MyIcons.type_regular__state_outline__library_notification,
                    color: selectedIndex == 3 ? AppColors.orange : Colors.grey,
                  ),
                  if (selectedIndex == 3)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: AppColors.orange,
                    ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
