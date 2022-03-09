import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/sign_provider.dart';
import 'package:organico_app/services/auth_service.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/buttons_widget.dart';
import 'package:organico_app/widgets/text_form_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "New Registration",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingMarginConst.symmetricHorizontalPM,
          child: ChangeNotifierProvider(
            create: (context) => SignProvider(),
            builder: (BuildContext context, Widget? child) {
              return SizedBox(
                height: SizeConst.height(790),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "It looks like you don't have an account on this number. Please let us know some information for a secure service.",
                      style: TextStyle(
                        fontSize: FontsConst.regularFont,
                        color: ColorsConst.tGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizeConst.hBox(48),
                    Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: FontsConst.regularFont,
                        color: ColorsConst.tDarkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizeConst.hBox(10),
                    TextFieldW.textForm(
                      "Full Name",
                      textController: _nameController,
                    ),
                    SizeConst.hBox(16),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: FontsConst.regularFont,
                        color: ColorsConst.tDarkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizeConst.hBox(10),
                    TextFieldW.textForm(
                      "Phone Number",
                      textController: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizeConst.hBox(16),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: FontsConst.regularFont,
                        color: ColorsConst.tDarkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizeConst.hBox(10),
                    TextFieldW.textForm(
                      "Password",
                      textController: _passwordController,
                      suffix: InkWell(
                        child: SvgPicture.asset(
                          "assets/icons/eye.svg",
                          fit: BoxFit.none,
                        ),
                        onTap: () =>
                            context.read<SignProvider>().changeObsecureText(),
                      ),
                      obscureText: context.watch<SignProvider>().obsecureText,
                    ),
                    SizeConst.hBox(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: context.watch<SignProvider>().termsOfUse,
                          side: BorderSide(
                            color: ColorsConst.tGrey,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          onChanged: (v) {
                            context.read<SignProvider>().changeTermsOfUse();
                          },
                        ),
                        Text(
                          "I accept the ",
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Terms of Use ",
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.pGreen,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "and ",
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.pGreen,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizeConst.hBox(48),
                    ButtonsW.buttonGreen(
                      375,
                      52,
                      "Sign Up",
                      () {
                        _firestore
                            .collection("users")
                            .doc(_phoneController.text)
                            .set(
                          {
                            "fullname": _nameController.text,
                            "phoneNumber": _phoneController.text,
                            "password": _passwordController.text,
                            "joinTime": FieldValue.serverTimestamp(),
                            "email": "",
                            "photo": "",
                            "addresess": [],
                            "coupons": [],
                            "favourites": [],
                            "historyOfOrders": [],
                            "cart": {
                              "products": [],
                              "counts": [],
                            },
                          },
                        ).then(
                          (value) => AuthService().signUpWithPhoneNumber(
                            context,
                            _phoneController.text,
                          ),
                        );
                      },
                    ),
                    SizeConst.hBox(24),
                    Center(
                      child: Text(
                        "or use",
                        style: TextStyle(
                          fontSize: FontsConst.regularFont,
                          color: ColorsConst.tGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizeConst.hBox(24),
                    SizedBox(
                      width: SizeConst.width(374),
                      height: SizeConst.height(52),
                      child: ElevatedButton(
                        child: Text(
                          "Sign Up with Google",
                          style: TextStyle(
                            fontSize: FontsConst.regularFont,
                            color: ColorsConst.tBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: ColorsConst.tGrey),
                            borderRadius:
                                BorderRadius.circular(SizeConst.width(100)),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
