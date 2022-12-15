import 'package:flutter/material.dart';
import 'package:shopz_app/controller/user_controller.dart';
import 'package:shopz_app/view/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

  UserController _controller = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/ic_launcher.png"),
              height: 150,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Login"),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password"),
              ),
              onChanged: _controller.setPass,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!_controller.auth(context)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          _controller.snackBar("login or password is wrong"));
                    }
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text("Register"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
