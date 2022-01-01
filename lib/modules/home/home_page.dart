import 'package:flutter/material.dart';
import 'package:payflow/shared/thems/app_colors.dart';
import 'package:payflow/shared/thems/app_text_style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152), //Tamanho obrigatorio
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                  text: "Ola ",
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: "Josias!",
                      style: AppTextStyles.titleRegular,
                    )
                  ])),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                )),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary),
              child: Icon(Icons.add),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.description_outlined, color: AppColors.body)),
          ],
        ),
      ),
    );
  }
}
