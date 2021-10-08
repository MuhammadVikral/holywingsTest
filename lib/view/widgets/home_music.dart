import 'package:flutter/material.dart';
import 'package:holywings/services/main_menu_services.dart';

class Music extends StatefulWidget {
  const Music({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<dynamic> music = [];

  bool isLoading = true;

  @override
  void didChangeDependencies() async {
    var response = await MainMenuServices().fetchHighMusic();
    setState(() {
      isLoading = false;
      music = response;
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: const Color(0xff2c2c2c),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HolyPeople TopCharts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            SizedBox(
              height: widget.size.height * 0.4,
              child: ListView.separated(
                itemCount: music.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Image.network(
                        music[index]['song']['originalartist']['image'] ??
                            'test',
                        fit: BoxFit.fill,
                        height: size.height * 0.05,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('error');
                        },
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            music[index]['song']['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                music[index]['song']['originalartist']['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                  );
                },
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage('assets/ic_apple_music.png'),
                  width: widget.size.width * 0.3,
                ),
                Image(
                  image: const AssetImage('assets/ic_spotify.png'),
                  width: widget.size.width * 0.3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
