import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

class CardForm extends CardRegular {
  CardForm({
    @required Widget child,
    EdgeInsetsGeometry margin,
  }) : super(
          child: child,
          margin: margin ?? EdgeInsets.fromLTRB(Dimens.defaultBodyMargin, 24, Dimens.defaultBodyMargin, 0),
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        );
}

class CardRegular extends Container {
  CardRegular({
    @required Widget child,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    BoxShadow shadow,
  }) : super(
          margin: margin ?? EdgeInsets.symmetric(horizontal: Dimens.defaultBodyMargin),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: padding ?? EdgeInsets.all(0),
              child: child,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            boxShadow: <BoxShadow>[
              shadow ??
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
            ],
          ),
        );
}

class CardRaised extends CardRegular {
  CardRaised({
    @required Widget child,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
  }) : super(
          child: child,
          margin: margin,
          padding: padding,
          shadow: BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        );
}
