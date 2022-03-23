import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Notifications",
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            onPressed: () => Navigator.pushNamed(context, "/settings"),
          ),
        ],
      ),
      body: Padding(
        padding: PaddingMarginConst.allPM,
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              isThreeLine: true,
              leading: SvgPicture.asset("assets/images/track.svg"),
              title: Text(
                "Order Status",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Congratulations, your order has been sent. You can check here.\n25 Feb 2021 06:15 AM",
                style: TextStyle(
                  fontSize: FontsConst.smallFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizeConst.hBox(20),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              isThreeLine: true,
              leading: SvgPicture.asset("assets/images/promo.svg"),
              title: Text(
                "New Promo",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "15% discount for all purchases above \$20. Check it now.\n25 Feb 2021 05:00 AM",
                style: TextStyle(
                  fontSize: FontsConst.smallFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizeConst.hBox(20),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              isThreeLine: true,
              leading: SvgPicture.asset("assets/images/mail.svg"),
              title: Text(
                "Tips",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Let's learn how to maximize the use of vouchers in the application.\n24 Feb 2021 02:00 PM",
                style: TextStyle(
                  fontSize: FontsConst.smallFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
