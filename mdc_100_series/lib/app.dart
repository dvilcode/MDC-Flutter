// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'common/colors.dart';
import 'supplemental/cut_corners_border.dart';
import 'model/product.dart';
import 'widgets/backdrop.dart';
import 'widgets/category_menu_page.dart';
import 'home.dart';
import 'login.dart';

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: Backdrop(
        currencyCategory: _currentCategory,
        frontLayer: HomePage(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // accentColor: kShrineBrown900,
    // primaryColor: kShrinePink100,
    primaryColor: kShrinePurple,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(8.0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
        // foregroundColor: MaterialStateProperty.all<Color>(kShrineBrown900),
        // backgroundColor: MaterialStateProperty.all<Color>(kShrinePink100),
        foregroundColor: MaterialStateProperty.all<Color>(kShrineSurfaceWhite),
        backgroundColor: MaterialStateProperty.all<Color>(kShrinePurple),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
        // foregroundColor: MaterialStateProperty.all<Color>(kShrineBrown900),
        foregroundColor: MaterialStateProperty.all<Color>(kShrinePurple),
      ),
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionTheme: base.textSelectionTheme.copyWith(
      // selectionColor: kShrinePink100,
      selectionColor: kShrinePurple,
    ),
    errorColor: kShrineErrorRed,
    textTheme: _buildShrineTextTheme(base.textTheme),
    appBarTheme: base.appBarTheme.copyWith(
      // textTheme: _buildShrineTextTheme(base.textTheme, kShrineBrown900),
      textTheme: _buildShrineTextTheme(base.textTheme, kShrineSurfaceWhite),
    ),
    primaryTextTheme: _buildShrineTextTheme(base.textTheme, kShrineBrown900),
    accentTextTheme: _buildShrineTextTheme(base.textTheme, kShrineBrown900),
    primaryIconTheme: base.iconTheme.copyWith(
      // color: kShrineBrown900,
      color: kShrineSurfaceWhite,
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base, [Color? color]) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontSize: 24,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w400,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 20.0,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: base.subtitle1!.copyWith(
          fontSize: 16,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400,
        ),
        caption: base.caption!.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
        button: base.button!.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      )
      .apply(
        // fontFamily: 'Rubik',
        fontFamily: 'Raleway',
        displayColor: color,
        bodyColor: color,
      );
}
