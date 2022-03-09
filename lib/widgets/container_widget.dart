import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/products_model.dart';
import 'package:organico_app/model/users_model.dart';

class ContainerW {
  static Container regularContainer(
    BuildContext context, {
    double? width,
    double? height,
    int? index,
    ProductsModel? product,
    UsersModel? user,
  }) {
    return Container(
      width: SizeConst.width(width!),
      height: SizeConst.height(height!),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConst.width(20),
        vertical: SizeConst.height(20),
      ),
      decoration: BoxDecoration(
        color: Color(
          int.parse(product!.all![index!].color!),
        ),
        borderRadius: BorderRadius.circular(
          SizeConst.width(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: product.all![index].image!,
            fit: BoxFit.contain,
            width: 200,
            height: 55,
          ),
          SizeConst.hBox(14),
          Text(
            product.all![index].name!,
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
            product.all![index].category!,
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
                "\$${product.all![index].price} /Kg",
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
                  user!.favourites!.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      width: MediaQuery.of(context).size.width * 0.5,
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
  }
}
