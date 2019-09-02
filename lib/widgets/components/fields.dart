import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/models/accounts/user_model.dart';
import 'package:com_cingulo_sample/widgets/components/components_l10n.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

class GenderInput extends StatefulWidget {
  final Function(UserGender value) onChanged;
  final UserGender initialValue;

  GenderInput({
    @required this.onChanged,
    this.initialValue,
  });

  @override
  State<StatefulWidget> createState() => GenderInputState();
}

class GenderInputState extends State<GenderInput> {
  UserGender _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  void didUpdateWidget(GenderInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != null) {
      _value = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ComponentsL10n l10n = AppL10n.of<ComponentsL10n>(context);
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(height: 16),
            Container(
              padding: EdgeInsets.only(top: 2, left: 11, right: 7, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColor.slate.withOpacity(.5),
                  width: 1,
                ),
              ),
              child: DropdownButton<UserGender>(
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto-Regular',
                  color: AppColor.slate,
                ),
                hint: Text(l10n.fieldsGender),
                isExpanded: true,
                value: _value,
                onChanged: (UserGender value) {
                  setState(() => _value = value);
                  widget.onChanged(value);
                },
                items: <UserGender>[
                  UserGender.female,
                  UserGender.male,
                  UserGender.unknown,
                ].map<DropdownMenuItem<UserGender>>(
                  (UserGender value) {
                    String text;
                    if (value == UserGender.female) {
                      text = l10n.fieldsGenderFemale;
                    } else if (value == UserGender.male) {
                      text = l10n.fieldsGenderMale;
                    } else {
                      text = l10n.fieldsGenderUnknown;
                    }
                    return DropdownMenuItem<UserGender>(
                      value: value,
                      child: Text(text),
                    );
                  },
                ).toList(),
                underline: Container(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 3, left: 12, bottom: 7),
              child: Text(
                l10n.fieldsGenderHelper,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto-Regular',
                  color: AppColor.slate.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
        _value == null
            ? Wrap()
            : Positioned(
                top: 13,
                left: 7,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: AppColor.white,
                    child: Text(
                      l10n.fieldsGender,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto-Regular',
                        color: AppColor.slate,
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class TextInput extends Container {
  TextInput({
    @required String labelText,
    String hintText = '',
    String helperText = '',
    TextEditingController controller,
    TextInputAction textInputAction,
    TextInputType keyboardType = TextInputType.text,
    FormFieldValidator<String> validator,
    IconButton suffixIcon,
    bool obscureText = false,
    FocusNode focusNode,
    bool enabled,
    Function onFieldSubmitted,
    int minLines,
    int maxLines,
  }) : super(
          margin: EdgeInsets.only(top: 16, bottom: 8),
          child: TextFormField(
            controller: controller,
            textInputAction: textInputAction,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            style: _textStyle(fontSize: 16, color: AppColor.slate, height: .9),
            cursorColor: AppColor.midBlue,
            cursorWidth: 1,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              suffixIcon: suffixIcon,
              labelText: labelText,
              labelStyle: _textStyle(fontSize: 16, color: AppColor.slate),
              hintText: hintText,
              hintStyle: _textStyle(color: AppColor.slate),
              helperText: helperText,
              helperStyle: _textStyle(color: AppColor.slate.withOpacity(.5), height: .5),
              enabledBorder: _border(color: AppColor.slate.withOpacity(.5), width: 1),
              disabledBorder: _border(color: AppColor.slate.withOpacity(.3), width: 1),
              focusedBorder: _border(color: AppColor.midBlue),
              focusedErrorBorder: _border(color: AppColor.darkPeach),
              errorStyle: _textStyle(color: AppColor.darkPeach, height: .5),
              errorBorder: _border(color: AppColor.darkPeach),
            ),
            enabled: enabled,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted ?? (_) {},
            minLines: minLines,
            maxLines: maxLines,
          ),
        );

  static TextStyle _textStyle({
    double fontSize = 12,
    Color color = AppColor.darkPeach,
    double height = 1,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: height,
      fontFamily: 'Roboto-Regular',
      color: color,
    );
  }

  static OutlineInputBorder _border({@required Color color, double width = 2}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final String labelText;
  final TextInputAction textInputAction;
  final bool enabled;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  PasswordInput({
    this.controller,
    this.textInputAction,
    @required this.labelText,
    this.validator,
    this.keyboardType,
    this.enabled,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<StatefulWidget> createState() {
    return _PasswordInputState();
  }
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      labelText: widget.labelText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _obscure,
      enabled: widget.enabled,
      suffixIcon: IconButton(
        icon: Icon(
          _obscure ? Icons.visibility : Icons.visibility_off,
          color: AppColor.battleshipGrey.withOpacity(.5),
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
