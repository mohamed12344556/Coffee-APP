import '../../core/di/dependency_injection.dart';
import '../../cubit/coffee_cubit.dart';
import '../../data/database_helper/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/coffee_model.dart';
import '../widgets/build_banner.dart';
import '../widgets/build_home_app_bar.dart';
import '../widgets/coffee_bottom_navigation_bar.dart';
import '../widgets/coffee_list.dart';

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  static const String id = "coffee_home_page";

  @override
  State<StatefulWidget> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  int selectedCategoryIndex = 0;
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  List<CoffeeModel> filteredCoffeeItems = [];

  @override
  void initState() {
    super.initState();
    fetchCoffeeItems();
    searchController.addListener(filterCoffeeItems);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchCoffeeItems() async {
    final coffeeItems = await locator<DatabaseHelper>().readDB();
    setState(() {
      filteredCoffeeItems = coffeeItems;
    });
  }

  void filterCoffeeItems() async {
    final allCoffeeItems = await locator<DatabaseHelper>().readDB();
    setState(() {
      filteredCoffeeItems = allCoffeeItems
          .where((coffee) => coffee.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

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
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        if (state is CoffeeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoffeeLoaded) {
          final coffeeItems = state.coffees;
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffF9F9F9),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child:
                        BuildCustomAppBar(SearchController: searchController),
                  ),
                  const Positioned(
                    top: 200,
                    left: 20,
                    right: 20,
                    child: BuildBanner(),
                  ),
                  Positioned.fill(
                    top: 380,
                    child: CoffeeList(
                      coffeeItems: searchController.text.isEmpty
                          ? coffeeItems
                          : filteredCoffeeItems,
                      selectedCategoryIndex: selectedCategoryIndex,
                      updateCategory: updateCategory,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: CoffeeBottomNavigationBar(
                selectedIndex: selectedIndex,
                onItemTapped: onItemTapped,
              ),
            ),
          );
        } else if (state is CoffeeEmpty) {
          return const Center(child: Text('No coffee items available'));
        } else if (state is CoffeeError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
