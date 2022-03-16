import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/model/users_model.dart';
import 'package:organico_app/provider/profile_provider.dart';
import 'package:organico_app/services/users_service.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/buttons_widget.dart';
import 'package:organico_app/widgets/text_form_widget.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Edit Profile",
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: ServiceUsers.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<UsersModel> _snapshot) {
            if (!_snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (_snapshot.hasError) {
              return const Center(child: Text("Something went wrong!"));
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConst.width(20),
                    vertical: SizeConst.height(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: ChangeNotifierProvider(
                          create: (context) => ProfileProvider(),
                          builder: (BuildContext context, Widget? child) {
                            return Stack(
                              children: <Widget>[
                                _snapshot.data!.photo!.isEmpty
                                    ? CircleAvatar(
                                        radius: SizeConst.width(85.5),
                                        child:
                                            const Icon(Icons.person, size: 50),
                                      )
                                    : CircleAvatar(
                                        radius: SizeConst.width(85.5),
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          _snapshot.data!.photo!,
                                        ),
                                      ),
                                Positioned(
                                  bottom: 0,
                                  right: 5,
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                      "assets/icons/camera.svg",
                                      width: SizeConst.width(44),
                                      height: SizeConst.height(44),
                                    ),
                                    onTap: () async {
                                      await context
                                          .read<ProfileProvider>()
                                          .changePhoto(context);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizeConst.hBox(32),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: FontsConst.regularFont,
                          color: ColorsConst.tDarkGrey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(10),
                      TextFieldW.textForm(
                        textController: _nameController,
                      ),
                      SizeConst.hBox(16),
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: FontsConst.regularFont,
                          color: ColorsConst.tDarkGrey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(10),
                      TextFieldW.textForm(
                        textController: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizeConst.hBox(16),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: FontsConst.regularFont,
                          color: ColorsConst.tDarkGrey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(10),
                      SizedBox(
                        width: SizeConst.width(374),
                        height: SizeConst.height(127),
                        child: TextFormField(
                          maxLines: 4,
                          controller: _addressController,
                          cursorColor: ColorsConst.pGreen,
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConst.width(16)),
                              ),
                              borderSide: BorderSide(
                                color: ColorsConst.tLineDark,
                                width: SizeConst.width(1.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConst.width(16)),
                              ),
                              borderSide: BorderSide(
                                color: ColorsConst.tLineDark,
                                width: SizeConst.width(1.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizeConst.hBox(109),
                      ButtonsW.buttonGreen(
                        374,
                        52,
                        "Save",
                        () async {
                          _firestore
                              .collection("users")
                              .doc(_authUser.currentUser!.phoneNumber)
                              .set(
                            {
                              "fullname": _nameController.text,
                              "phoneNumber": _phoneController.text,
                              "address": _addressController.text,
                            },
                            SetOptions(merge: true),
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
