import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/services/auth_service.dart';
import 'package:organico_app/widgets/list_tile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: FontsConst.mediumFont,
            color: ColorsConst.tBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
              fit: BoxFit.none,
            ),
            splashRadius: 1,
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: _firestore
              .collection("users")
              .doc(_authUser.currentUser!.phoneNumber)
              .get(),
          builder: (BuildContext context, AsyncSnapshot _snapshot) {
            if (!_snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (_snapshot.hasError) {
              return const Text("Something went wrong!");
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConst.width(20),
                    vertical: SizeConst.height(24),
                  ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: SizeConst.width(85.5),
                        child: _snapshot.data["photo"].isEmpty
                            ? const Icon(Icons.person, size: 50)
                            : CachedNetworkImage(
                                imageUrl: _snapshot.data["photo"],
                              ),
                      ),
                      SizeConst.hBox(24),
                      Text(
                        _snapshot.data["fullname"],
                        style: TextStyle(
                          fontSize: FontsConst.mediumFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(8),
                      Text(
                        _snapshot.data["phoneNumber"],
                        style: TextStyle(
                          fontSize: FontsConst.mediumFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(44),
                      ListTileW.listTile(
                        title: "Edit Profile",
                        leading: "assets/images/profile.svg",
                      ),
                      ListTileW.listTile(
                        title: "My Orders",
                        leading: "assets/images/file.svg",
                      ),
                      ListTileW.listTile(
                        title: "My Wishlist",
                        leading: "assets/images/favourite.svg",
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Image.asset("assets/images/location.png"),
                        title: Text(
                          "My Address",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          "assets/icons/arrow_forward.svg",
                          fit: BoxFit.none,
                        ),
                        onTap: () {},
                      ),
                      ListTileW.listTile(
                        title: "Payment Method",
                        leading: "assets/images/card.svg",
                      ),
                      ListTileW.listTile(
                        title: "Customer Service",
                        leading: "assets/images/headphones.svg",
                      ),
                      ListTileW.listTile(
                        title: "Change Password",
                        leading: "assets/images/lock.svg",
                        onTap: () => Navigator.pushNamed(
                          context,
                          "/reset_password",
                        ),
                      ),
                      ListTileW.listTile(
                        title: "Logout",
                        leading: "assets/images/exit.svg",
                        onTap: () => AuthService().signOut(),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
