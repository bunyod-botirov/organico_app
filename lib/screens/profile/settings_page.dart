import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/provider/settings_provider.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Notification Settings",
      ),
      body: Padding(
        padding: PaddingMarginConst.symmetricHorizontalPM,
        child: ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: <Widget>[
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  value: context.watch<SettingsProvider>().inAppNotif,
                  onChanged: (bool v) =>
                      context.read<SettingsProvider>().changeInAppNotif(),
                  activeTrackColor: ColorsConst.pGreen.withOpacity(0.15),
                  activeColor: ColorsConst.pGreen,
                  inactiveThumbColor: ColorsConst.tGrey,
                  inactiveTrackColor: ColorsConst.tWhiteGrey,
                  title: Text(
                    "In App Notification",
                    style: TextStyle(
                      fontSize: FontsConst.regularFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  value: context.watch<SettingsProvider>().promo,
                  onChanged: (bool v) =>
                      context.read<SettingsProvider>().changePromo(),
                  activeTrackColor: ColorsConst.pGreen.withOpacity(0.15),
                  activeColor: ColorsConst.pGreen,
                  inactiveThumbColor: ColorsConst.tGrey,
                  inactiveTrackColor: ColorsConst.tWhiteGrey,
                  title: Text(
                    "New Promo",
                    style: TextStyle(
                      fontSize: FontsConst.regularFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  value: context.watch<SettingsProvider>().tips,
                  onChanged: (bool v) =>
                      context.read<SettingsProvider>().changeTips(),
                  activeTrackColor: ColorsConst.pGreen.withOpacity(0.15),
                  activeColor: ColorsConst.pGreen,
                  inactiveThumbColor: ColorsConst.tGrey,
                  inactiveTrackColor: ColorsConst.tWhiteGrey,
                  title: Text(
                    "Tips & trick",
                    style: TextStyle(
                      fontSize: FontsConst.regularFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  value: context.watch<SettingsProvider>().update,
                  onChanged: (bool v) =>
                      context.read<SettingsProvider>().changeUpdate(),
                  activeTrackColor: ColorsConst.pGreen.withOpacity(0.15),
                  activeColor: ColorsConst.pGreen,
                  inactiveThumbColor: ColorsConst.tGrey,
                  inactiveTrackColor: ColorsConst.tWhiteGrey,
                  title: Text(
                    "Update Application",
                    style: TextStyle(
                      fontSize: FontsConst.regularFont,
                      color: ColorsConst.tBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
