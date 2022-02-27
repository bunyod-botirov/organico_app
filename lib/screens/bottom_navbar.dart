import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/bottom_navbar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavBarProvider(),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: context
                .watch<BottomNavBarProvider>()
                .pages[context.watch<BottomNavBarProvider>().currentPage],
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: SizeConst.height(74),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeConst.width(20)),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.15),
                  offset: const Offset(1, 2),
                  blurRadius: 15,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeConst.width(20)),
              ),
              child: BottomNavigationBar(
                currentIndex: context.watch<BottomNavBarProvider>().currentPage,
                backgroundColor: ColorsConst.tWhite,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorsConst.pGreen,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: FontsConst.regularFont,
                ),
                unselectedItemColor: ColorsConst.tDarkGrey,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: FontsConst.regularFont,
                ),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/home.svg"),
                    activeIcon:
                        SvgPicture.asset("assets/icons/home_active.svg"),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/search.svg"),
                    activeIcon:
                        SvgPicture.asset("assets/icons/search_active.svg"),
                    label: "Explore",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/cart.svg"),
                    activeIcon:
                        SvgPicture.asset("assets/icons/cart_active.svg"),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/profile.svg"),
                    activeIcon:
                        SvgPicture.asset("assets/icons/profile_active.svg"),
                    label: "Profile",
                  ),
                ],
                onTap: (value) {
                  context.read<BottomNavBarProvider>().changePages(value);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
