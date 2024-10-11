import 'package:flutter/material.dart';
import 'package:grabber/constant/app_data.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 1,
  );
  double currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: PageView.builder(
        controller: _pageController,
        itemCount: BannerData.items.length,
        itemBuilder: (context, index) {
          final banner = BannerData.items[index];

          double scaleFactor = (currentPage - index).abs().clamp(0.0, 1.0);
          double scale = 1 - (scaleFactor * 0.1);
          return Transform.scale(
            scaleX: 1,
            scaleY: scale,
            child: SizedBox(
              child: Card(
                color: banner.bannerColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: banner.titleColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            banner.description,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: banner.descriptionColor,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Material(
                            color: banner.buttonColor,
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: () {
                                // Action for the button
                              },
                              borderRadius: BorderRadius.circular(5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                    color: banner.buttonTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        banner.image,
                        fit: BoxFit.contain,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}