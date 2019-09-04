import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/colors.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ActionScaffold extends Scaffold {
  ActionScaffold({
    @required String title,
    @required List<Widget> actions,
    @required Widget body,
    @required Widget floatingActionButton,
  }) : super(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff256CB3),
            title: Text(title),
            actions: actions,
          ),
          body: body,
          floatingActionButton: floatingActionButton,
        );
}

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
  static const double height = 56;
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
            Center(
              child: Text(
                title,
                style: TextStyles.SerifSubheadingNegative,
              ),
            ),
            !showBackButton
                ? Container()
                : Positioned(
                    top: 0,
                    left: 9,
                    bottom: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24,
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

class HeadingButtonsScaffold extends StatefulWidget {
  final String title;
  final String leftButtonText;
  final Function() leftButtonOnPressed;
  final String rightButtonText;
  final Function() rightButtonOnPressed;
  final Widget body;
  final Color backgroundColor;

  HeadingButtonsScaffold({
    @required this.title,
    @required this.leftButtonText,
    @required this.rightButtonText,
    @required this.body,
    this.leftButtonOnPressed,
    this.rightButtonOnPressed,
    this.backgroundColor = AppColor.white,
  });

  @override
  State<StatefulWidget> createState() => HeadingButtonsScaffoldState();
}

class HeadingButtonsScaffoldState extends State<HeadingButtonsScaffold> {
  PublishSubject<void> _leftButtonOnPressed$ = PublishSubject<void>();
  PublishSubject<void> _rightButtonOnPressed$ = PublishSubject<void>();
  bool _disabled = false;

  @override
  void dispose() {
    _leftButtonOnPressed$.close();
    _leftButtonOnPressed$ = null;
    _rightButtonOnPressed$.close();
    _rightButtonOnPressed$ = null;
    super.dispose();
  }

  void _setDisabled(bool disabled) {
    setState(() => _disabled = disabled);
  }

  void _leftButtonOnPressed() {
    _leftButtonOnPressed$.add(null);
    if (widget.leftButtonOnPressed != null) {
      widget.leftButtonOnPressed();
    }
  }

  void _rightButtonOnPressed() {
    _rightButtonOnPressed$.add(null);
    if (widget.rightButtonOnPressed != null) {
      widget.rightButtonOnPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeadingButtons(
      leftButtonOnPressed: _leftButtonOnPressed$.stream,
      rightButtonOnPressed: _rightButtonOnPressed$.stream,
      setDisabled: _setDisabled,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: HeadingButtonsAppBar(
          title: widget.title,
          leftButtonText: widget.leftButtonText,
          leftButtonOnPressed: _leftButtonOnPressed,
          rightButtonText: widget.rightButtonText,
          rightButtonOnPressed: _rightButtonOnPressed,
          disabled: _disabled,
        ),
        body: widget.body,
      ),
    );
  }
}

class HeadingButtons extends InheritedWidget {
  final Stream<void> leftButtonOnPressed;
  final Stream<void> rightButtonOnPressed;
  final Function(bool disabled) setDisabled;

  HeadingButtons({
    @required this.leftButtonOnPressed,
    @required this.rightButtonOnPressed,
    @required this.setDisabled,
    @required Widget child,
  }) : super(child: child);

  static HeadingButtons of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(HeadingButtons) as HeadingButtons;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class HeadingButtonsAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 56;
  final String title;
  final String leftButtonText;
  final Function() leftButtonOnPressed;
  final String rightButtonText;
  final Function() rightButtonOnPressed;
  final bool disabled;

  HeadingButtonsAppBar({
    @required this.title,
    @required this.leftButtonText,
    @required this.leftButtonOnPressed,
    @required this.rightButtonText,
    @required this.rightButtonOnPressed,
    this.disabled = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColor.battleshipGrey,
                    fontSize: 14,
                    fontFamily: "Roboto-Regular",
                  ),
                ),
              ),
            ),
            Positioned(
              top: 7.5,
              left: 0,
              child: ButtonWhiteSoft(
                text: leftButtonText,
                onPressed: leftButtonOnPressed,
                disabled: disabled,
              ),
            ),
            Positioned(
              top: 7.5,
              right: 0,
              child: ButtonWhite(
                text: rightButtonText,
                onPressed: rightButtonOnPressed,
                disabled: disabled,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DividerLine(),
            )
          ],
        ),
      ),
    );
  }
}
