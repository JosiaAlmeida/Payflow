
import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';
import 'shared/thems/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}
