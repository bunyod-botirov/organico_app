import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/services/auth_service.dart';
import 'package:organico_app/widgets/list_tile_widget.dart';

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
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
              fit: BoxFit.none,
            ),
            splashRadius: 1,
            onPressed: () => Navigator.pushNamed(context, "/notifications"),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: _firestore
              .collection("users")
              .doc(_authUser.currentUser!.phoneNumber ??
                  _authUser.currentUser!.email)
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
                      _snapshot.data["photo"].isEmpty
                          ? CircleAvatar(
                              radius: SizeConst.width(85.5),
                              child: const Icon(Icons.person, size: 50),
                            )
                          : CircleAvatar(
                              radius: SizeConst.width(85.5),
                              backgroundImage: NetworkImage(
                                _snapshot.data["photo"],
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
                        _snapshot.data["phoneNumber"].isEmpty
                            ? _snapshot.data["email"]
                            : _snapshot.data["phoneNumber"],
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
                        onTap: () =>
                            Navigator.pushNamed(context, "/edit_profile"),
                      ),
                      ListTileW.listTile(
                        title: "My Orders",
                        leading: "assets/images/file.svg",
                        onTap: () => Navigator.pushNamed(context, "/orders"),
                      ),
                      ListTileW.listTile(
                        title: "My Wishlist",
                        leading: "assets/images/favourite.svg",
                        onTap: () =>
                            Navigator.pushNamed(context, "/favourites"),
                      ),
                      ListTileW.listTile(
                        title: "Payment Method",
                        leading: "assets/images/card.svg",
                        onTap: () =>
                            Navigator.pushNamed(context, "/payment_method"),
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
                        onTap: () {
                          AuthService().signOut();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/splash",
                            (route) => false,
                          );
                        },
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
