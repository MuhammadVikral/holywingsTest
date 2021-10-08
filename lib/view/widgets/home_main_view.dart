import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:holywings/services/main_menu_services.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<dynamic> imageUrl = [];
  bool isLoading = true;
  @override
  void didChangeDependencies() async {
    var response = await MainMenuServices().fetchHighlight();
    setState(() {
      isLoading = false;
      imageUrl = response;
      // highlight = response;
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
    return SizedBox(
      height: widget.size.height * 0.3,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : CarouselSlider.builder(
              itemCount: imageUrl.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  width: widget.size.width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.network(
                      imageUrl[itemIndex]['news'] != null
                          ? imageUrl[itemIndex]['news']['image']
                          : imageUrl[itemIndex]['promo']['image'],
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('error');
                      },
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: widget.size.height * 0.3,
                viewportFraction: 0.9,
                autoPlay: true,
              ),
            ),
    );
  }
}
