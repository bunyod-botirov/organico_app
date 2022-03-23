import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/provider/home_page_provider.dart';
import 'package:organico_app/services/products_service.dart';
import 'package:organico_app/services/users_service.dart';
import 'package:organico_app/widgets/messenger_widget.dart';
import 'package:organico_app/widgets/text_form_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait(
          [
            ServiceUsers.getUsers(),
            ServiceProducts.getProducts(),
          ],
        ),
        builder: (BuildContext context, AsyncSnapshot<List> _snapshot) {
          if (!_snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong!",
                style: TextStyle(
                  fontSize: FontsConst.extraLargeFont,
                  color: ColorsConst.tBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          } else {
            UsersModel _user = _snapshot.data![0];
            ProductsModel _products = _snapshot.data![1];

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: appBar(context),
                ),
                SliverToBoxAdapter(
                  child: ListTile(
                    contentPadding: PaddingMarginConst.symmetricHorizontalPM,
                    leading: SvgPicture.asset("assets/images/coupon.svg"),
                    title: Text(
                      "You have ${_user.coupons!.length} coupon",
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
                    onTap: () => Navigator.pushNamed(
                      context,
                      "/coupons",
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
                    trailing: InkWell(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: FontsConst.smallFont,
                          color: ColorsConst.tDarkGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        "/search",
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
                      itemCount: _products.categories!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizeConst.wBox(16);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            width: SizeConst.width(123),
                            height: SizeConst.height(134),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConst.width(20),
                              vertical: SizeConst.height(20),
                            ),
                            decoration: BoxDecoration(
                              color: Color(
                                int.parse(_products.all![index].color!),
                              ),
                              borderRadius:
                                  BorderRadius.circular(SizeConst.width(20)),
                            ),
                            child: Column(
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: _products.categories![index].image!,
                                  fit: BoxFit.contain,
                                  width: 200,
                                  height: 40,
                                ),
                                SizeConst.hBox(14),
                                Text(
                                  _products.categories![index].name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: FontsConst.smallFont,
                                    color: ColorsConst.tBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                            context,
                            "/types",
                            arguments: [_user, _products.categories![index]],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: SizeConst.height(25)),
                  sliver: body(_products, _user),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  SizedBox appBar(BuildContext context) {
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
            enabling: true,
            onTap: () {
              Navigator.pushNamed(context, "/search");
            },
          ),
        ],
      ),
    );
  }

  SliverGrid body(ProductsModel _products, UsersModel _user) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                contentPadding: PaddingMarginConst.symmetricHorizontalPM,
                dense: true,
                title: Text(
                  _products.types![index].type.toString(),
                  style: TextStyle(
                    fontSize: FontsConst.mediumFont,
                    color: ColorsConst.tBlack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: InkWell(
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: FontsConst.smallFont,
                      color: ColorsConst.tDarkGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/search",
                  ),
                ),
              ),
              SizedBox(
                height: SizeConst.height(242),
                child: ListView.separated(
                  padding: PaddingMarginConst.symmetricHorizontalPM,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _products.types![index].builder!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizeConst.wBox(12);
                  },
                  itemBuilder: (BuildContext context, int _index) {
                    return InkWell(
                      child: Container(
                        width: SizeConst.width(196),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConst.width(20),
                          vertical: SizeConst.height(20),
                        ),
                        decoration: BoxDecoration(
                          color: Color(
                            int.parse(_products
                                .types![index].builder![_index].color!),
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeConst.width(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: _products
                                  .types![index].builder![_index].image!,
                              fit: BoxFit.contain,
                              width: SizeConst.width(200),
                              height: SizeConst.height(70),
                            ),
                            SizeConst.hBox(14),
                            Text(
                              _products.types![index].builder![_index].name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: FontsConst.smallFont,
                                color: ColorsConst.tBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizeConst.hBox(4),
                            Text(
                              _products
                                  .types![index].builder![_index].category!,
                              style: TextStyle(
                                fontSize: FontsConst.smallFont,
                                color: ColorsConst.tGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizeConst.hBox(26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "\$${_products.types![index].builder![_index].price!} /Kg",
                                  style: TextStyle(
                                    fontSize: FontsConst.regularFont,
                                    color: ColorsConst.tBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  child: SvgPicture.asset(
                                    "assets/images/add.svg",
                                    width: SizeConst.width(36),
                                    height: SizeConst.height(36),
                                  ),
                                  onTap: () {
                                    _user.favourites!.add(
                                      _products.types![index].builder![_index],
                                    );
                                    MessengerW.messenger(context, "Added");
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        "/product",
                        arguments: [
                          _user,
                          _products.types![index].builder![_index]
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        childCount: _products.types!.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: SizeConst.height(305),
        mainAxisSpacing: SizeConst.height(25),
      ),
    );
  }
}
