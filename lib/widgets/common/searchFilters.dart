import 'package:Collectables/utilities/index.dart';

InkWell getSearchFilters(IconData icon, String text, Function onTap) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Icon(
          icon,
        ),
        sizedBox(0, 5),
        Text(text),
      ],
    ),
  );
}
