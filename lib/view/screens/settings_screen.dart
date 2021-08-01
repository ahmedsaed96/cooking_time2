import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/settings_states.dart';
import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:cocking_time/local/shared_prefrences.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:cocking_time/view/widgets/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingaScreen extends StatelessWidget {
  static const routeName = 'SettingaScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTittle: 'Settings', context: context),
      drawer: CustomDrawer(),
      body: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) => SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Change Mode'),
                    SizedBox(width: phoneSize(context).width / 3),
                    const Text('Dark'),
                    Switch(
                      inactiveThumbColor: Colors.black87,
                      value: SettingsCubit.get(context).switchValue,
                      onChanged: (val) {
                        SettingsCubit.get(context).changeTheme(val);
                        MySharedPrefrences.saveStringLocal(
                            key: 'mode',
                            value: SettingsCubit.get(context)
                                .switchValue
                                .toString());
                      },
                    ),
                    const Text('Light'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
