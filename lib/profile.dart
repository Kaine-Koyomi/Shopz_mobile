import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber[900],
                  image: const DecorationImage(
                    image:
                        AssetImage("assets/images/default-profile-photo.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 100,
                width: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "nome do usuário",
                  style: TextStyle(
                    fontSize: 29,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 200,
          color: Colors.grey[200],
        )
      ],
    );
  }
}
