import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marvelheroes_app/app/modules/dashboard/infra/model/characters_response_model/characters_response_model.dart';

class DefaultCarousel extends StatefulWidget {
  final List<Result> results;
  const DefaultCarousel({super.key, required this.results});

  @override
  State<DefaultCarousel> createState() => _DefaultCarouselState();
}

class _DefaultCarouselState extends State<DefaultCarousel> {
  late PageController _pageController;
  int activePage = 0;

  late Timer _timer;
  bool timerActive = false;

  @override
  void initState() {
    print('hora: ${DateTime.now()}');
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: activePage,
    );
    _startTime();
    super.initState();
  }

  void _startTime() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      timerActive = !timerActive;
      if (timerActive) {
        if (activePage < widget.results.length - 1) {
          activePage++;
        } else {
          activePage = 0;
        }
        _pageController.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        bool isIndicatorSelected = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.all(3),
          width: isIndicatorSelected ? 12 : 10,
          height: isIndicatorSelected ? 12 : 10,
          decoration: BoxDecoration(
            color: isIndicatorSelected ? Colors.black : Colors.black26,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                activePage = currentIndex;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        );
      },
    );
  }

  void nextImage() {}
  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemCount: widget.results.length,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return _CarouselSlider(
                image:
                    '${widget.results[pagePosition].thumbnail.path}.${widget.results[pagePosition].thumbnail.extension}',
                pagePosition: pagePosition,
                active: active,
                title: widget.results[pagePosition].name,
                subTitle: widget.results[pagePosition].description,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(widget.results.length, activePage),
        ),
      ],
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  const _CarouselSlider({
    required this.image,
    required this.pagePosition,
    required this.active,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final int pagePosition;
  final bool active;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            image,
          ),
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 3)),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.9,
            ],
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
