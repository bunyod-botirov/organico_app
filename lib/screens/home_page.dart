import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
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
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
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
                          value:
                              context.watch<HomePageProvider>().dropDownValue,
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
                          borderRadius:
                              BorderRadius.circular(SizeConst.width(20)),
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
                            context
                                .read<HomePageProvider>()
                                .changeDropDownValue(value);
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
            ),
          ),
        ],
      ),
    );
  }
}
