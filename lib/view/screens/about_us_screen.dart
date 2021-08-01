import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = 'AboutUsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
