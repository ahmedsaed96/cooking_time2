import 'package:clipboard/clipboard.dart';
import 'package:cocking_time/constant.dart';
import 'package:cocking_time/local/shared_prefrences.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:cocking_time/view/widgets/functions.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = 'AboutUsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTittle: 'About us'),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ahmedsaednegm96@gmail.com',
                  style: googleStyleSmall(context),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                    onPressed: () {
                      FlutterClipboard.copy('ahmedsaednegm96@gmail.com')
                          .then((value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Copied'),
                        ));
                      }).catchError((e) {
                        debugPrint('erorr cant copy the Email $e');
                      });
                    },
                    icon: Icon(
                      Icons.copy,
                      color: MySharedPrefrences.getString(key: 'mode') == 'true'
                          ? Colors.black
                          : Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
