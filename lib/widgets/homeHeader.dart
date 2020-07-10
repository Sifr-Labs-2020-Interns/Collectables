import 'package:Collectables/utilities/index.dart';

Column getHomeHeader(BuildContext context, String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 11,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    ],
  );
}
