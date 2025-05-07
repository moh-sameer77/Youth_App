import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';

class CustomPageViewSlider extends StatefulWidget {
  final int itemCount;
  final double height;
  final double viewportFraction; // New property to control width
  final List<Widget> Function(BuildContext, int) itemBuilder;

  const CustomPageViewSlider({
    super.key,
    required this.itemCount,
    required this.height,
    this.viewportFraction = 0.9, // Default value to show part of the next item
    required this.itemBuilder,
  });

  @override
  State<CustomPageViewSlider> createState() => _CustomPageViewSliderState();
}

class _CustomPageViewSliderState extends State<CustomPageViewSlider> {
  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.itemCount,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, index).first;
            },
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.itemCount, (index) =>
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 12.0 : 8.0,
              height: _currentPage == index ? 12.0 : 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? AppTheme.lightAppColors.primary
                    : AppTheme.lightAppColors.bordercolor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
