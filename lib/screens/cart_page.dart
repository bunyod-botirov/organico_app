import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/buttons_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: FontsConst.mediumFont,
            color: ColorsConst.tBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: PaddingMarginConst.allPM,
        child: Column(
          children: <Widget>[
            ExpansionTile(
              childrenPadding:
                  EdgeInsets.symmetric(vertical: SizeConst.height(20)),
              initiallyExpanded: true,
              leading: SvgPicture.asset("assets/icons/shop.svg"),
              title: Text(
                "Popey Shop - New York",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Text(""),
              children: <Widget>[
                Container(
                  padding: PaddingMarginConst.symmetricHorizontalPM,
                  width: SizeConst.width(342),
                  height: SizeConst.height(114),
                  decoration: BoxDecoration(
                    color: ColorsConst.pGreen.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(SizeConst.width(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(SizeConst.width(12)),
                        child: Image.network(
                          "https://catalog.korzinka.uz/storage/api/149000009-00011/small_15915364650798046.jpg",
                          width: SizeConst.width(64),
                          height: SizeConst.height(64),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Kiwi",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: FontsConst.regularFont,
                              color: ColorsConst.tBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1 Kilogram",
                            style: TextStyle(
                              fontSize: FontsConst.smallFont,
                              color: ColorsConst.tGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "\$4.99",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: FontsConst.regularFont,
                              color: ColorsConst.tBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/images/add.svg",
                        width: SizeConst.width(32),
                        height: SizeConst.height(32),
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: FontsConst.largeFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/images/remove.svg",
                        width: SizeConst.width(32),
                        height: SizeConst.height(32),
                      ),
                    ],
                  ),
                ),
                SizeConst.hBox(20),
                Container(
                  padding: PaddingMarginConst.symmetricHorizontalPM,
                  width: SizeConst.width(342),
                  height: SizeConst.height(114),
                  decoration: BoxDecoration(
                    color: ColorsConst.sRed.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(SizeConst.width(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(SizeConst.width(12)),
                        child: Image.network(
                          "https://catalog.korzinka.uz/storage/products/small_07760baa2fe6b7ff63e14619c6829a88_61b9dc5e6dbde.png",
                          width: SizeConst.width(64),
                          height: SizeConst.height(64),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Red Apples",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: FontsConst.regularFont,
                              color: ColorsConst.tBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1 Kilogram",
                            style: TextStyle(
                              fontSize: FontsConst.smallFont,
                              color: ColorsConst.tGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "\$4.99",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: FontsConst.regularFont,
                              color: ColorsConst.tBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/images/add.svg",
                        width: SizeConst.width(32),
                        height: SizeConst.height(32),
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: FontsConst.largeFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/images/remove.svg",
                        width: SizeConst.width(32),
                        height: SizeConst.height(32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: FontsConst.largeFont,
                        color: ColorsConst.tGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "\$9.98",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: FontsConst.extraLargeFont,
                        color: ColorsConst.tBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ButtonsW.buttonGreen(
                  266,
                  52,
                  "Add to bag",
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
