import 'package:Collectables/utilities/index.dart';

TextFormField getTextField(BuildContext context, String labelText,
    TextEditingController controller, TextInputType type) {
  return TextFormField(
    controller: controller,
    onChanged: (value) {},
    keyboardType: type,
    obscureText: (type == TextInputType.visiblePassword) ? true : false,
    textAlign: TextAlign.left,
    cursorColor:
        (currentTheme(context) == lightTheme) ? Colors.black : Colors.white,
    style: TextStyle(
      color:
          (currentTheme(context) == lightTheme) ? Colors.black : Colors.white,
      fontSize: 14,
    ),
    decoration: (currentTheme(context) == lightTheme)
        ? konboardingtextdecorationlight.copyWith(
            labelText: labelText,
          )
        : konboardingtextdecorationdark.copyWith(labelText: labelText),
  );
}
