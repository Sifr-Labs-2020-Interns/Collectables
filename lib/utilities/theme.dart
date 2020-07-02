import 'package:Collectables/utilities/index.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Color(0xff00C569),
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    elevation: 1.0,
    color: Color(0xff000000),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xffffffff),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Color(0xffffffff),
  ),
  cursorColor: Color(0xffffffff),
  backgroundColor: Color(0xff000000),
  scaffoldBackgroundColor: Color(0xff222222),
  secondaryHeaderColor: Color(0xff9B9B9B),
  cardColor: Color(0xff2A2C36),
  primaryColor: Color(0xffffffff),
  buttonColor: Color(0xffffffff),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Color(0xffffffff),
  scaffoldBackgroundColor: Color(0xfffdfdfd),
  accentColor: Color(0xff00C569),
  primaryColor: Color(0xff000000),
  cursorColor: Color(0xff000000),
  secondaryHeaderColor: Color(0xff9B9B9B),
  fontFamily: 'Montserrat',
  cardColor: Color(0xffffffff),
  buttonColor: Color(0xffffffff),
  appBarTheme: AppBarTheme(
    elevation: 1.0,
    color: Color(0xffffffff),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xff000000),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xff000000),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Color(0xff000000),
  ),
);
