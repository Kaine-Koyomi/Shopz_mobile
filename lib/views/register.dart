import 'package:flutter/material.dart';
import 'package:shopz_app/controllers/user_controller.dart';

class Register extends StatelessWidget {
  UserController _controller = UserController();
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, right: 28, left: 28),
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
                      label: Text("Name"),
                    ),
                    onChanged: _controller.setName,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                    ),
                    onChanged: _controller.setNLogin,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                    ),
                    onChanged: _controller.setNPass,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Confirm password"),
                    ),
                    onChanged: _controller.setNConfPass,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!_controller.register()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          _controller.snackBar("the passwords don't match"),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
