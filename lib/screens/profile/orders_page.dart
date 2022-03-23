import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/buttons_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: FontsConst.mediumFont,
            color: ColorsConst.tBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
          labelColor: ColorsConst.pGreen,
          unselectedLabelColor: ColorsConst.tGrey,
          labelStyle: TextStyle(
            fontSize: FontsConst.mediumFont,
            fontWeight: FontWeight.w700,
          ),
          tabs: const <Widget>[
            Tab(text: "Ongoing"),
            Tab(text: "History"),
          ],
          onTap: (int v) {
            _tabController!.index = v;
            setState(() {});
          },
        ),
      ),
      body: _tabController!.index == 0
          ? Padding(
              padding: PaddingMarginConst.symmetricHorizontalPM,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/images/order_empty.svg"),
                  Text(
                    "There is no ongoing order right now. You can order from home.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: FontsConst.mediumFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizeConst.hBox(32),
                  ButtonsW.buttonGreen(
                    374,
                    52,
                    "Go home",
                    () {},
                  ),
                ],
              ),
            )
          : Padding(
              padding: PaddingMarginConst.symmetricHorizontalPM,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/images/order_empty.svg"),
                  Text(
                    "Your history is empty!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: FontsConst.mediumFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizeConst.hBox(32),
                  ButtonsW.buttonGreen(
                    374,
                    52,
                    "Go home",
                    () {},
                  ),
                ],
              ),
            ),
    );
  }
}
