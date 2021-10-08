import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff2c2c2c),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            width: size.width * 0.08,
            height: size.width * 0.1,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/ic_login.png',
                ),
              ),
            ),
          ),
          const FittedBox(
            child: Text(
              'Login to see voucher and point information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
