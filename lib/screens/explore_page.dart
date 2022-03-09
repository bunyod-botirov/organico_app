import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/services/products_service.dart';
import 'package:organico_app/services/users_service.dart';
import 'package:organico_app/widgets/messenger_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Explore",
          style: TextStyle(
            fontSize: FontsConst.mediumFont,
            color: ColorsConst.tBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/sort.svg",
              width: SizeConst.width(24),
              height: SizeConst.height(24),
            ),
            onPressed: () => Navigator.pushNamed(context, "/search"),
          ),
        ],
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
              itemCount: _products.all!.length,
              padding: EdgeInsets.all(SizeConst.width(20)),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: SizeConst.height(234),
                mainAxisSpacing: SizeConst.height(20),
                crossAxisSpacing: SizeConst.width(20),
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConst.width(20),
                      vertical: SizeConst.height(20),
                    ),
                    decoration: BoxDecoration(
                      color: Color(int.parse(_products.all![index].color!)),
                      borderRadius: BorderRadius.circular(SizeConst.width(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: _products.all![index].image!,
                          fit: BoxFit.contain,
                          width: SizeConst.width(200),
                          height: SizeConst.height(70),
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
                                MessengerW.messenger(context,"Added");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/product",
                    arguments: [_user, _products.all![index]],
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
