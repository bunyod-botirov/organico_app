import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/buttons_widget.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Payment Method",
      ),
      body: Padding(
        padding: PaddingMarginConst.allPM,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConst.width(12)),
                side: BorderSide(
                  color: ColorsConst.tLineDark,
                  width: 1,
                ),
              ),
              leading: SvgPicture.asset("assets/images/card.svg"),
              title: Text(
                "Order Status",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SvgPicture.asset("assets/icons/arrow_forward.svg"),
            ),
            SizeConst.hBox(20),
            ListTile(
              contentPadding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConst.width(12)),
                side: BorderSide(
                  color: ColorsConst.tLineDark,
                  width: 1,
                ),
              ),
              leading: SvgPicture.asset("assets/images/paypal.svg"),
              title: Text(
                "PayPal",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SvgPicture.asset("assets/icons/arrow_forward.svg"),
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonsW.buttonGreen(
        374,
        52,
        "Add payment",
        () => Navigator.pushNamed(context, "/add_payment"),
      ),
    );
  }
}
