import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeadingThin extends Container {
  HeadingThin(
    String title, {
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: Dimens.defaultBodyMargin),
  }) : super(
          margin: margin,
          padding: EdgeInsets.only(top: 21, bottom: 6),
          child: Text(
            title,
            style: TextStyles.SansThinHeading,
          ),
        );
}

class SubheadingDescription extends Column {
  SubheadingDescription({
    @required String title,
    @required String description,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(height: 16),
            Text(title, style: TextStyles.SansBoldSubheading),
            Text(description, style: TextStyles.SansRegular),
            Container(height: 4),
          ],
        );
}
