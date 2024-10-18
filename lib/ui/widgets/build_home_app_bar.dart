import 'package:coffee_shop_app/core/themes/app_colors.dart';
import 'package:coffee_shop_app/my_icons.dart';
import 'package:flutter/material.dart';

class BuildCustomAppBar extends StatelessWidget {
  const BuildCustomAppBar({
    super.key, required this.SearchController,
  });

  final TextEditingController  SearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff111111),
            Color(0xff313131),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xffA2A2A2),
            ),
          ),
          const SizedBox(height: 8),
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
                MyIcons.type_regular__state_outline__library_arrow___down_2,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: SearchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search coffee',
                    hintStyle: const TextStyle(color: Color(0xffA2A2A2)),
                    prefixIcon: const Icon(
                      MyIcons.type_regular__state_outline__library_search,
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
                    MyIcons.type_regular__state_outline__library_filter,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
