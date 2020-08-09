import 'package:Collectables/utilities/index.dart';

Widget getDropDownList(String currentValue, List values, Function toggle) {
  return DropdownButton(
    iconEnabledColor: Colors.black,
    iconDisabledColor: Colors.black,
    dropdownColor: Colors.white,
    value: currentValue,
    items: values
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: AutoSizeText(
              value,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        )
        .toList(),
    onChanged: toggle,
  );
}
