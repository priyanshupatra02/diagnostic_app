import 'package:card_swiper/card_swiper.dart';
import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/data/model/carousel_model.dart';
import 'package:diagnostic_app/shared/widget/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageCarouselWidget extends StatefulWidget {
  final List<BannerData> items;

  const HomePageCarouselWidget({
    super.key,
    required this.items,
  });

  @override
  State<HomePageCarouselWidget> createState() => _HomePageCarouselWidgetState();
}

int pageNo = 0;

class _HomePageCarouselWidgetState extends State<HomePageCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              viewportFraction: 0.85,
              scale: 0.90,
              autoplay: true,
              fade: 0.3,
              onIndexChanged: (index) {
                setState(() {
                  pageNo = index;
                });
              },
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CacheNetworkImageWidget(
                          imageUrl:
                              '${AppUrls.imgBaseUrlForRoutineTest}${widget.items[index].bannerPhoto}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: pageNo,
          count: widget.items.length,
          effect: const WormEffect(
            dotHeight: 6,
            dotWidth: 6,
            dotColor: AppColors.kGrey400,
            activeDotColor: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
