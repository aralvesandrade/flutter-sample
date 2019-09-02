import 'package:com_cingulo_sample/widgets/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DividerLine extends Container {
  static final double height = 1.0;

  DividerLine({
    color = AppColor.paleGrey,
  }) : super(
          height: height,
          color: color,
        );
}

class DividerText extends Row {
  DividerText({
    String text,
  }) : super(
          children: <Widget>[
            _divider(EdgeInsets.only(right: 16)),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 14,
                color: AppColor.battleshipGrey,
              ),
            ),
            _divider(EdgeInsets.only(left: 16)),
          ],
        );

  static Widget _divider(EdgeInsets edgeInsets) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: edgeInsets,
        color: AppColor.blueyGrey,
        height: 1,
      ),
    );
  }
}
