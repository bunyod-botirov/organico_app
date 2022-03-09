import 'package:flutter/material.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Reset Password",
      ),
    );
  }
}
