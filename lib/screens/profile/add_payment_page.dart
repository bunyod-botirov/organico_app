import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';

class AddPaymentPage extends StatelessWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Add Payment Method",
      ),
      body: Padding(
        padding: PaddingMarginConst.allPM,
        child: Column(
          children: <Widget>[
            Text(
              "Select Method",
              style: TextStyle(
                fontSize: FontsConst.mediumFont,
                color: ColorsConst.tBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
