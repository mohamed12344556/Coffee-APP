import '../../core/themes/app_colors.dart';
import '../../my_icons.dart';
import 'package:flutter/material.dart';

class CoffeeBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CoffeeBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: const Color(0xFF1B1B1B),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildNavItem(
          icon: MyIcons.type_regular__state_outline__library_home,
          isSelected: selectedIndex == 0,
        ),
        _buildNavItem(
          icon: MyIcons.type_regular__state_outline__library_heart,
          isSelected: selectedIndex == 1,
        ),
        _buildNavItem(
          icon: MyIcons.type_regular__state_outline__library_bag,
          isSelected: selectedIndex == 2,
        ),
        _buildNavItem(
          icon: MyIcons.type_regular__state_outline__library_notification,
          isSelected: selectedIndex == 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      {required IconData icon, required bool isSelected}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(icon, color: isSelected ? AppColors.orange : Colors.grey),
          if (isSelected)
            Container(
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(18),
              ),
              margin: const EdgeInsets.only(top: 4),
              height: 5,
              width: 10,
            ),
        ],
      ),
      label: '',
    );
  }
}
















// BottomNavigationBar(
        //   currentIndex: selectedIndex,
        //   onTap: onItemTapped,
        //   backgroundColor: const Color(0xFF1B1B1B),
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Column(
        //         children: [
        //           Icon(
        //             MyIcons.type_regular__state_outline__library_home,
        //             color: selectedIndex == 0 ? AppColors.orange : Colors.grey,
        //           ),
        //           if (selectedIndex == 0)
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: AppColors.orange,
        //                 borderRadius: BorderRadius.circular(18),
        //               ),
        //               margin: const EdgeInsets.only(top: 4),
        //               height: 5,
        //               width: 10,
        //             ),
        //         ],
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Column(
        //         children: [
        //           Icon(
        //             MyIcons.type_regular__state_outline__library_heart,
        //             color: selectedIndex == 1 ? AppColors.orange : Colors.grey,
        //           ),
        //           if (selectedIndex == 1)
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: AppColors.orange,
        //                 borderRadius: BorderRadius.circular(18),
        //               ),
        //               margin: const EdgeInsets.only(top: 4),
        //               height: 5,
        //               width: 10,
        //             ),
        //         ],
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Column(
        //         children: [
        //           Icon(
        //             MyIcons.type_regular__state_outline__library_bag,
        //             color: selectedIndex == 2 ? AppColors.orange : Colors.grey,
        //           ),
        //           if (selectedIndex == 2)
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: AppColors.orange,
        //                 borderRadius: BorderRadius.circular(18),
        //               ),
        //               margin: const EdgeInsets.only(top: 4),
        //               height: 5,
        //               width: 10,
        //             ),
        //         ],
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Column(
        //         children: [
        //           Icon(
        //             MyIcons.type_regular__state_outline__library_notification,
        //             color: selectedIndex == 3 ? AppColors.orange : Colors.grey,
        //           ),
        //           if (selectedIndex == 3)
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: AppColors.orange,
        //                 borderRadius: BorderRadius.circular(18),
        //               ),
        //               margin: const EdgeInsets.only(top: 4),
        //               height: 5,
        //               width: 10,
        //             ),
        //         ],
        //       ),
        //       label: '',
        //     ),
        //   ],
        // ),