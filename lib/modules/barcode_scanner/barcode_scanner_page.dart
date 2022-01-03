import 'package:flutter/material.dart';
import 'package:payflow/shared/thems/app_colors.dart';
import 'package:payflow/shared/thems/app_text_style.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class BarcodePage extends StatefulWidget {
  BarcodePage({Key? key}) : super(key: key);

  @override
  _BarcodePageState createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.background,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Escaneie o codigo de barras",
          style: AppTextStyles.buttonBackground,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.black,
          )),
          Expanded(flex: 2, child: Container(color: Colors.white)),
          Expanded(
              child: Container(
            color: Colors.black,
          )),
        ],
      ),
      bottomNavigationBar: LabelButton(
        label: "label",
        onPressed: () {},
      ),
    );
  }
}
