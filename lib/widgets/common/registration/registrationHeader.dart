import 'package:Collectables/utilities/index.dart';

Expanded getRegistrationHeader(int flex, String text, Function func) {
  return Expanded(
    flex: flex,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (text != 'Login')
            ? GestureDetector(
                onTap: () {
                  func();
                },
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                ),
              )
            : Container(),
        sizedBox(15, 0),
        Text(
          text,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}
