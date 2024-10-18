import '../../my_icons.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 115,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
            MyIcons.type_regular__state_outline__library_arrow___left_2),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text('Detail'),
      actions: [
        IconButton(
          icon: const Icon(MyIcons.type_regular__state_outline__library_heart),
          onPressed: () {},
        ),
      ],
    );
  }