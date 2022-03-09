import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/provider/product_page_provider.dart';
import 'package:organico_app/widgets/buttons_widget.dart';
import 'package:organico_app/widgets/messenger_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, this.data}) : super(key: key);

  final List? data;

  @override
  Widget build(BuildContext context) {
    final UsersModel _user = data![0];
    final All _product = data![1];

    return ChangeNotifierProvider(
      create: (context) => ProductPageProvider(),
      builder: (BuildContext context, Widget? child) {
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
            actions: <Widget>[
              IconButton(
                splashRadius: SizeConst.width(25),
                icon: SvgPicture.asset(
                  "assets/icons/favourite.svg",
                  color: _user.favourites!.contains(_product)
                      ? ColorsConst.sRed
                      : ColorsConst.tBlack,
                  width: SizeConst.width(20),
                  height: SizeConst.height(20),
                ),
                onPressed: () {
                  context
                      .read<ProductPageProvider>()
                      .addToFavourites(_user, _product);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  SizeConst.width(20),
                  0,
                  SizeConst.width(20),
                  SizeConst.height(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: _product.image!,
                        width: SizeConst.width(239.84),
                        height: SizeConst.height(194),
                      ),
                    ),
                    SizeConst.hBox(24),
                    Text(
                      _product.name!,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: FontsConst.extraLargeFont,
                        color: ColorsConst.tBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeConst.hBox(4),
                    Row(
                      children: <Widget>[
                        Text(
                          _product.category!,
                          style: TextStyle(
                            fontSize: FontsConst.mediumFont,
                            color: ColorsConst.tGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          child: SvgPicture.asset(
                            "assets/images/remove.svg",
                            width: SizeConst.width(40),
                            height: SizeConst.height(40),
                          ),
                          onTap: () {
                            context
                                .read<ProductPageProvider>()
                                .decrementProduct();
                          },
                        ),
                        SizeConst.wBox(24),
                        Text(
                          context
                              .watch<ProductPageProvider>()
                              .productCount
                              .toString(),
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: FontsConst.extraLargeFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizeConst.wBox(24),
                        InkWell(
                          child: SvgPicture.asset(
                            "assets/images/add.svg",
                            width: SizeConst.width(40),
                            height: SizeConst.height(40),
                          ),
                          onTap: () {
                            context
                                .read<ProductPageProvider>()
                                .incrementProduct();
                          },
                        ),
                      ],
                    ),
                    SizeConst.hBox(4),
                    Text(
                      "\$${_product.price} /Kg",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: FontsConst.extraLargeFont,
                        color: ColorsConst.tBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizeConst.hBox(44),
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: FontsConst.mediumFont,
                        color: ColorsConst.tBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizeConst.hBox(16),
                    Text(
                      _product.description!,
                      overflow:
                          context.watch<ProductPageProvider>().descriptionText
                              ? TextOverflow.ellipsis
                              : null,
                      maxLines:
                          context.watch<ProductPageProvider>().descriptionText
                              ? 3
                              : null,
                      style: TextStyle(
                        fontSize: FontsConst.regularFont,
                        color: ColorsConst.tGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            context.watch<ProductPageProvider>().descriptionText
                                ? "Read more"
                                : "Read less",
                            style: TextStyle(
                              fontSize: FontsConst.regularFont,
                              color: ColorsConst.tBlack,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            context
                                .read<ProductPageProvider>()
                                .changeDescription();
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      leading: SvgPicture.asset("assets/images/clock.svg"),
                      title: Text(
                        "Time Delivery",
                        style: TextStyle(
                          fontSize: FontsConst.mediumFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _product.timeDelivery!,
                        style: TextStyle(
                          fontSize: FontsConst.smallFont,
                          color: ColorsConst.tGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizeConst.hBox(5),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      leading: SvgPicture.asset("assets/images/category.svg"),
                      title: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: FontsConst.mediumFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _product.category!,
                        style: TextStyle(
                          fontSize: FontsConst.smallFont,
                          color: ColorsConst.tGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizeConst.hBox(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ButtonsW.buttonGreen(
                          298,
                          52,
                          "Add to cart",
                          () {
                            _user.cart!.products!.add(_product);
                            _user.cart!.counts!.add(
                              Provider.of<ProductPageProvider>(context,
                                      listen: false)
                                  .productCount,
                            );
                            MessengerW.messenger(context,"Added");
                          },
                        ),
                        SvgPicture.asset("assets/icons/chat.svg"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
