import 'package:flutter/material.dart';
import 'package:holywings/view/widgets/home_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xfff2c76f),
        backgroundColor: const Color(0xff1d1d1d),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1d1d1d),
      appBar: HomeAppBar(size: size),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainView(size: size),
              Profile(size: size),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage('assets/ic_reservation.png'),
                    width: size.width * 0.2,
                  ),
                  Image(
                    image: const AssetImage('assets/ic_home_dinein.png'),
                    width: size.width * 0.2,
                  ),
                  Image(
                    image: const AssetImage('assets/ic_home_takeaway.png'),
                    width: size.width * 0.2,
                  ),
                  Image(
                    image: const AssetImage('assets/ic_outlets.png'),
                    width: size.width * 0.2,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Music(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
