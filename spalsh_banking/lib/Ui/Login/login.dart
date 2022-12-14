import 'package:flutter/material.dart';
import 'package:spalsh_banking/Const/AppString.dart';
import 'package:spalsh_banking/Const/Style/FontStyle.dart';
import 'package:spalsh_banking/Const/appColor.dart';
import 'package:spalsh_banking/Ui/Login/Forget_password.dart';
import 'package:spalsh_banking/Ui/Login/Idia.dart';
import 'package:spalsh_banking/Ui/Login/Sign_up.dart';
import '../../Helper/auth_helper.dart';
import '../Home/BottomNavController.dart';

class Login_Screen extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: AppColor.backHoneyDew,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppString.images[0]),
              width: double.infinity,
              height: height / 9,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppString.logintext,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppString.subtitle_homeScreen),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter email',
                    hintText: AppString.enteremail,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _pass,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter password',
                    hintText: AppString.enterpassword,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Forget_password())),
                    child: Text(
                      AppString.forget_password,
                      style: TextStyle(color: AppColor.green),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final UserEmail = _email.text;
                    final UserPass = _pass.text;
                    var obj = Aouth_Helper();
                    obj.signIn(UserEmail, UserPass, context);
                  },
                  child: Container(
                    height: 50,
                    color: AppColor.green,
                    child: Center(
                        child: Text(
                      AppString.login,
                      style: FontStyle.b_17ffstyleC,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sign_up()),
                );
              },
              child: Text(
                AppString.needaccount,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.fingerprint,
              size: height / 15,
              color: AppColor.green,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppString.use_fingerprint,
              style: TextStyle(color: AppColor.green),
            ),
          ],
        ),
      ),
    );
  }
}
