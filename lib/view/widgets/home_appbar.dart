import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      actions: [
        ImageIcon(
          const AssetImage(
            'assets/ic_qr.png',
          ),
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        ImageIcon(
          const AssetImage(
            'assets/ic_notif.png',
          ),
          color: Theme.of(context).primaryColor,
        ),
      ],
      title: const Text(
        'Hi,Holly People',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
