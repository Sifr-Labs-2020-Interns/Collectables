import 'package:Collectables/utilities/index.dart';
import 'package:infinity_page_view/infinity_page_view.dart';

class SliderBanner extends StatefulWidget {
  final List<Slide> slides;
  final bool autoScroll;
  SliderBanner({@required this.slides, @required this.autoScroll});
  _SliderBannerState createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  int _currentPage = 0;
  final InfinityPageController _pageController =
      InfinityPageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    if (widget.autoScroll == true)
      Timer.periodic(
        Duration(seconds: 3),
        (Timer timer) {
          if (_currentPage < widget.slides.length) {
            _currentPage++;
            _pageController.animateToPage(
              _currentPage,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
            );
          }
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        InfinityPageView(
          // reverse: true,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: widget.slides.length,
          itemBuilder: (ctx, i) => SlideItem(
            widget.slides[i].imageUrl,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < widget.slides.length; i++)
              if (i == _currentPage) SlideDots(true) else SlideDots(false)
          ],
        )
      ],
    );
  }
}
