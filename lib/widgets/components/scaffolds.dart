import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/widgets/styles/colors.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

class FadedBlueScaffold extends Scaffold {
  FadedBlueScaffold({
    @required bool showBackButton,
    @required String title,
    @required Widget body,
  }) : super(
          appBar: FadedBlueAppBar(showBackButton, title),
          body: body,
        );
}

class FadedBlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 128;
  final bool showBackButton;
  final String title;

  FadedBlueAppBar(this.showBackButton, this.title);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return FadedBlueHeroContainer(
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                title,
                style: TextStyles.SerifSubheadingNegative,
              ),
            ),
            !showBackButton
                ? Container()
                : Positioned(
                    top: 22,
                    left: 9,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 54,
                        color: AppColor.white,
                      ),
                      onPressed: () => AppRouter.router.pop(context),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class FadedBlueHeroContainer extends StatelessWidget {
  static const String heroTag = 'FadedBlueHeroContainer';
  final Widget child;

  FadedBlueHeroContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Material(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 2,
              child: Container(
                color: Color(0xff256CB3),
                child: child,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(AppImage.fadedBlueContainerDivider),
                    //   fit: BoxFit.fill,
                    // ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
