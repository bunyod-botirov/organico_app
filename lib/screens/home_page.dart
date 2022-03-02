import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/home_page_provider.dart';
import 'package:organico_app/widgets/text_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: appBar(),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              contentPadding: PaddingMarginConst.symmetricHorizontalPM,
              leading: SvgPicture.asset("assets/icons/coupon.svg"),
              title: Text(
                "You have 3 coupon",
                style: TextStyle(
                  fontSize: FontsConst.mediumFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "Let's use this coupon",
                style: TextStyle(
                  fontSize: FontsConst.smallFont,
                  color: ColorsConst.tDarkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/arrow_forward.svg",
                matchTextDirection: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              contentPadding: PaddingMarginConst.symmetricHorizontalPM,
              dense: true,
              title: Text(
                "Choose Category",
                style: TextStyle(
                  fontSize: FontsConst.mediumFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                "See all",
                style: TextStyle(
                  fontSize: FontsConst.smallFont,
                  color: ColorsConst.tDarkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: SizeConst.height(134),
              child: ListView.separated(
                padding: PaddingMarginConst.symmetricHorizontalPM,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return SizeConst.wBox(16);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: SizeConst.width(123),
                    height: SizeConst.height(134),
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConst.width(20),
                      vertical: SizeConst.height(20),
                    ),
                    decoration: BoxDecoration(
                      color: ColorsConst.pGreen,
                      borderRadius: BorderRadius.circular(SizeConst.width(20)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/images/logo.svg",
                          fit: BoxFit.contain,
                          width: 200,
                          height: 40,
                        ),
                        SizeConst.hBox(14),
                        Text(
                          "Something",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: FontsConst.smallFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: SizeConst.height(25)),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            PaddingMarginConst.symmetricHorizontalPM,
                        dense: true,
                        title: Text(
                          "Best Selling",
                          style: TextStyle(
                            fontSize: FontsConst.mediumFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: FontsConst.smallFont,
                            color: ColorsConst.tDarkGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConst.height(242),
                        child: ListView.separated(
                          padding: PaddingMarginConst.symmetricHorizontalPM,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizeConst.wBox(12);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: SizeConst.width(196),
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConst.width(20),
                                vertical: SizeConst.height(20),
                              ),
                              decoration: BoxDecoration(
                                color: ColorsConst.pGreen,
                                borderRadius:
                                    BorderRadius.circular(SizeConst.width(20)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/images/logo.svg",
                                    fit: BoxFit.contain,
                                    width: 200,
                                    height: 40,
                                  ),
                                  SizeConst.hBox(14),
                                  Text(
                                    "Something",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: FontsConst.smallFont,
                                      color: ColorsConst.tBlack,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: SizeConst.height(305),
                mainAxisSpacing: SizeConst.height(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox appBar() {
    return SizedBox(
      height: SizeConst.height(166),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your Location",
            style: TextStyle(
              fontSize: FontsConst.smallFont,
              color: ColorsConst.tDarkGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
            builder: (BuildContext context, Widget? child) {
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: context.watch<HomePageProvider>().dropDownValue,
                  dropdownColor: ColorsConst.tWhite,
                  elevation: 1,
                  isDense: true,
                  alignment: Alignment.center,
                  icon: SvgPicture.asset("assets/icons/arrow_down.svg"),
                  style: TextStyle(
                    fontSize: FontsConst.mediumFont,
                    color: ColorsConst.tBlack,
                    fontWeight: FontWeight.w700,
                  ),
                  borderRadius: BorderRadius.circular(SizeConst.width(20)),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Toshkent"),
                      value: "Toshkent",
                    ),
                    DropdownMenuItem(
                      child: Text("Samarkand"),
                      value: "Samarkand",
                    ),
                    DropdownMenuItem(
                      child: Text("Farg'ona"),
                      value: "Farg'ona",
                    ),
                    DropdownMenuItem(
                      child: Text("Namangan"),
                      value: "Namangan",
                    ),
                    DropdownMenuItem(
                      child: Text("Andijon"),
                      value: "Andijon",
                    ),
                    DropdownMenuItem(
                      child: Text("Surxondaryo"),
                      value: "Surxondaryo",
                    ),
                    DropdownMenuItem(
                      child: Text("Qashqadaryo"),
                      value: "Qashqadaryo",
                    ),
                  ],
                  onChanged: (value) {
                    context.read<HomePageProvider>().changeDropDownValue(value);
                  },
                ),
              );
            },
          ),
          SizeConst.hBox(20),
          TextFieldW.searchField(
            "Search anything here",
            prefix: SvgPicture.asset(
              "assets/icons/search.svg",
              color: ColorsConst.tGrey,
              fit: BoxFit.none,
            ),
          ),
        ],
      ),
    );
  }
}
