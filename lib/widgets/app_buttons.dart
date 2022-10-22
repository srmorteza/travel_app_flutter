


import 'package:flutter/cupertino.dart';

import '../misc/colors.dart';

class AppButtons extends StatefulWidget {
  const AppButtons({Key? key}) : super(key: key);

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.buttonBackground,
      ),
    );
  }
}
