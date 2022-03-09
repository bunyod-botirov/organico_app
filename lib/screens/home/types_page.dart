import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/messenger_widget.dart';

class TypesPage extends StatelessWidget {
  const TypesPage({Key? key, this.data}) : super(key: key);

  final List? data;

  @override
  Widget build(BuildContext context) {
    final UsersModel _user = data![0];
    final Category _product = data![1];

    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: _product.name,
        actions: <Widget>[
          IconButton(
            splashRadius: SizeConst.width(25),
            icon: SvgPicture.asset(
              "assets/icons/sort.svg",
              width: SizeConst.width(24),
              height: SizeConst.height(24),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/search");
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _product.builder!.length,
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
                color: Color(int.parse(_product.builder![index].color!)),
                borderRadius: BorderRadius.circular(SizeConst.width(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: _product.builder![index].image!,
                    fit: BoxFit.contain,
                    width: SizeConst.width(200),
                    height: SizeConst.height(70),
                  ),
                  SizeConst.hBox(14),
                  Text(
                    _product.builder![index].name!,
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
                    _product.builder![index].category!,
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
                        "\$${_product.builder![index].price!} /Kg",
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
                            _product.builder![index],
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
              arguments: [_user, _product.builder![index]],
            ),
          );
        },
      ),
    );
  }
}
