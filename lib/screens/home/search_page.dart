import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/widgets/text_form_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          child: SvgPicture.asset(
            "assets/icons/arrow_back.svg",
            fit: BoxFit.none,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: TextFieldW.searchField(
          "Search anything here",
          prefix: SvgPicture.asset(
            "assets/icons/search.svg",
            color: ColorsConst.tGrey,
            fit: BoxFit.none,
          ),
          onTap: () {},
        ),
      ),
      body: Padding(
        padding: PaddingMarginConst.allPM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Recent",
              style: TextStyle(
                fontSize: FontsConst.mediumFont,
                color: ColorsConst.tBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
            // ListTile in the ListView
            ListTile(
              dense: true,
              leading: SvgPicture.asset(
                "assets/icons/search.svg",
                color: ColorsConst.tGrey,
                fit: BoxFit.none,
              ),
              title: Text(
                "Onion",
                style: TextStyle(
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/x.svg",
                fit: BoxFit.none,
              ),
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(
                "assets/icons/search.svg",
                color: ColorsConst.tGrey,
                fit: BoxFit.none,
              ),
              title: Text(
                "Watermelon",
                style: TextStyle(
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/x.svg",
                fit: BoxFit.none,
              ),
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(
                "assets/icons/search.svg",
                color: ColorsConst.tGrey,
                fit: BoxFit.none,
              ),
              title: Text(
                "Blackurrant",
                style: TextStyle(
                  fontSize: FontsConst.regularFont,
                  color: ColorsConst.tGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/x.svg",
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
