import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tonnsour/components/customization/quick_time_chooser.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:tonnsour/utils/helpers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  String dayStartTime = '0:00';
  String dayEndTime = '0:00';

  Future<void> _loadPreferences() async {
    final savedStartTime = await Helpers.getStringPref(kDayStartTime);
    if (savedStartTime != null) {
      setState(() {
        dayStartTime = savedStartTime;
      });
    }

    final savedEndTime = await Helpers.getStringPref(kDayEndTime);
    if (savedEndTime != null) {
      setState(() {
        dayEndTime = savedEndTime;
      });
    }
  }

  void dayStartChooser() {
    showDialog(
        context: context,
        builder: (context) {
          return QuickTimeChooser(
              timeSelectionListener: (time) {
                setState(() {
                  String timeHour = time.hour.toString().padLeft(2, '0');
                  String timeMin = time.minute.toString().padLeft(2, '0');
                  dayStartTime = '$timeHour:$timeMin';
                  Helpers.saveStringPref(kDayStartTime, dayStartTime);
                });
                Navigator.of(context).pop();
              },
              dialogMessage: 'Select the day start time');
        });
  }

  void dayEndChooser() {
    showDialog(
        context: context,
        builder: (context) {
          return QuickTimeChooser(
              timeSelectionListener: (time) {
                setState(() {
                  String timeHour = time.hour.toString().padLeft(2, '0');
                  String timeMin = time.minute.toString().padLeft(2, '0');
                  dayEndTime = '$timeHour:$timeMin';
                  Helpers.saveStringPref(kDayEndTime, dayEndTime);
                });
                Navigator.of(context).pop();
              },
              dialogMessage: 'Select the day end time');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        title: const Text(
          'Settings',
          style: TextStyle(
              color: kWhite, fontFamily: kPoppins, fontWeight: FontWeight.w800),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
              title: const Text(
                'Plan',
                style: TextStyle(
                    color: kBlue,
                    fontFamily: kPoppins,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700),
              ),
              tiles: [
                //  Chooser for day start time
                SettingsTile.navigation(
                  title: const Text(
                    'Day start time',
                    style: TextStyle(
                        color: kBlue,
                        fontFamily: kPoppins,
                        fontWeight: FontWeight.w600),
                  ),
                  leading: const Icon(
                    Icons.access_time,
                    color: kBlue,
                  ),
                  value: Text(
                    dayStartTime,
                    style: const TextStyle(
                        color: kBlack,
                        fontFamily: kPoppins,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: (context) => dayStartChooser(),
                ),

                //  Chooser for day end time
                SettingsTile.navigation(
                  title: const Text(
                    'Day end time',
                    style: TextStyle(
                        color: kBlue,
                        fontFamily: kPoppins,
                        fontWeight: FontWeight.w600),
                  ),
                  leading: const Icon(
                    Icons.access_time,
                    color: kBlue,
                  ),
                  value: Text(
                    dayEndTime,
                    style: const TextStyle(
                        color: kBlack,
                        fontFamily: kPoppins,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: (context) => dayEndChooser(),
                )
              ])
        ],
      ),
    );
  }
}
