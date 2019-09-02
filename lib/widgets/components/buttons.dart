import 'dart:io';

import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

class ButtonPrimary extends FlatButton {
  ButtonPrimary({
    String text,
    Function onPressed,
    bool disabled = false,
  }) : super(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          color: AppColor.midBlue,
          textColor: AppColor.white,
          highlightColor: AppColor.duskBlue,
          disabledColor: AppColor.paleBlue,
          disabledTextColor: AppColor.lightGreyBlue,
          onPressed: (disabled ? null : onPressed),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 14,
            ),
          ),
        );
}

class ButtonWhite extends FlatButton {
  ButtonWhite({
    String text,
    Function onPressed,
    bool disabled = false,
    Color textColor = AppColor.midBlue,
  }) : super(
          color: AppColor.white,
          textColor: textColor,
          highlightColor: textColor.withOpacity(.2),
          disabledColor: AppColor.white,
          disabledTextColor: textColor.withOpacity(.5),
          onPressed: (disabled ? null : onPressed),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 14,
            ),
          ),
        );
}

class ButtonWhiteSoft extends ButtonWhite {
  ButtonWhiteSoft({
    String text,
    Function onPressed,
    bool disabled = false,
  }) : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          textColor: AppColor.blueyGrey,
        );
}

class ButtonGreen extends FlatButton {
  ButtonGreen({
    String text,
    Function onPressed,
    bool disabled = false,
  }) : super(
          color: AppColor.lichen,
          textColor: AppColor.white,
          highlightColor: AppColor.flatGreen,
          disabledColor: AppColor.paleBlue,
          disabledTextColor: AppColor.lightGreyBlue,
          onPressed: (disabled ? null : onPressed),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 14,
            ),
          ),
        );
}

class ButtonDanger extends FlatButton {
  ButtonDanger({
    String text,
    Function onPressed,
    bool disabled = false,
  }) : super(
          color: AppColor.white,
          textColor: AppColor.darkPeach,
          highlightColor: AppColor.darkPeach.withOpacity(.2),
          disabledColor: AppColor.white,
          disabledTextColor: AppColor.darkPeach,
          onPressed: (disabled ? null : onPressed),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 14,
            ),
          ),
        );
}

class ButtonIcon extends FlatButton {
  ButtonIcon({
    Widget icon,
    String text,
    Function onPressed,
    bool disabled = false,
    Widget right,
  }) : super(
          color: AppColor.white,
          textColor: AppColor.slate,
          highlightColor: AppColor.slate.withOpacity(.1),
          disabledColor: AppColor.white,
          disabledTextColor: AppColor.blueyGrey,
          onPressed: (disabled ? null : onPressed),
          padding: EdgeInsets.all(0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                height: 24,
                width: 24,
                child: icon,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
              ),
              right ?? Container(),
            ],
          ),
        );
}

class ButtonIconSwitch extends ButtonIcon {
  ButtonIconSwitch({
    Widget icon,
    String text,
    Function onPressed,
    bool checked = false,
    bool disabled = false,
  }) : super(
          icon: icon,
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          right: Container(
            margin: EdgeInsets.only(right: 8),
            child: Switch(
              value: checked,
              onChanged: (bool value) => onPressed(),
              activeColor: AppColor.midBlue,
              activeTrackColor: AppColor.blueyGrey.withOpacity(0.4),
              inactiveTrackColor: AppColor.blueyGrey.withOpacity(0.4),
            ),
          ),
        );
}

class ButtonIconSmall extends FlatButton {
  ButtonIconSmall({
    Widget icon,
    String text,
    Function onPressed,
    bool disabled = false,
    Widget right,
    double width,
  }) : super(
          color: AppColor.white,
          textColor: AppColor.midBlue,
          highlightColor: AppColor.slate.withOpacity(.1),
          disabledColor: AppColor.white,
          disabledTextColor: AppColor.blueyGrey,
          onPressed: (disabled ? null : onPressed),
          padding: EdgeInsets.all(0),
          child: Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  height: 24,
                  width: 24,
                  child: icon,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8, right: 16),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                ),
                right ?? Container(),
              ],
            ),
          ),
        );
}

class ButtonShare extends ButtonIconSmall {
  ButtonShare({
    String text,
    String shareUrl,
    String contentType = '',
    String itemId = '',
  }) : super(
          text: text,
          icon: Icon(
            Platform.isAndroid ? Icons.share : CupertinoIcons.share,
            size: 24,
          ),
          onPressed: () {
            Share.share(shareUrl);
            Analytics.log("Share $shareUrl");
          },
        );
}
