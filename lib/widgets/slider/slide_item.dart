import 'package:Collectables/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final String imageUrl;
  SlideItem(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight(context) * 0.32,
          width: screenWidth(context),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        sizedBox(10, 0),
      ],
    );
  }
}
