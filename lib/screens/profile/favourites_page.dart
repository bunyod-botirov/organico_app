import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/services/users_service.dart';
import 'package:organico_app/services/products_service.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "My Wishlist",
      ),
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

            return GridView.builder(
              itemCount: _user.favourites!.length,
              padding: EdgeInsets.all(SizeConst.width(20)),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: SizeConst.height(234),
                mainAxisSpacing: SizeConst.height(20),
                crossAxisSpacing: SizeConst.width(20),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConst.width(20),
                    vertical: SizeConst.height(20),
                  ),
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(_products.all![index].color!),
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeConst.width(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: _products.all![index].image!,
                        fit: BoxFit.contain,
                        width: 200,
                        height: 55,
                      ),
                      SizeConst.hBox(14),
                      Text(
                        _products.all![index].name!,
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
                        _products.all![index].category!,
                        style: TextStyle(
                          fontSize: FontsConst.smallFont,
                          color: ColorsConst.tGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizeConst.hBox(22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "\$${_products.all![index].price!} /Kg",
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
                                _products.all![index],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  backgroundColor: ColorsConst.pGreen,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  content: Text(
                                    "Added",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: FontsConst.regularFont,
                                      color: ColorsConst.tWhite,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
