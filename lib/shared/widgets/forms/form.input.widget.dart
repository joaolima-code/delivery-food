import 'package:flutter/material.dart';

class FormInputWidget extends StatefulWidget {
  const FormInputWidget({
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    required this.label,
    this.onFocusChange,
    this.validator,
    this.onTap,
    this.onChanged,
    this.forgotPassword,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixVisibleText = false,
    super.key,
  });

  final String hintText;
  final String label;

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(bool)? onFocusChange;

  final Widget? forgotPassword;
  final Widget? suffixIcon;
  final bool suffixVisibleText;
  final Widget? prefixIcon;

  @override
  State<FormInputWidget> createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> {
  late bool _passwordVisible = false;

  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onFocusChange != null) {
      _focus.removeListener(_onFocusChange);
      _focus.dispose();
    }
  }

  void _onFocusChange() {
    if (widget.onFocusChange != null) {
      widget.onFocusChange!(_focus.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: widget.forgotPassword == null
                ? Text(widget.label,
                    style: Theme.of(context).textTheme.titleSmall)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text(widget.label,
                            style: Theme.of(context).textTheme.titleSmall),
                        widget.forgotPassword!
                      ])),
        TextFormField(
          controller: widget.textEditingController,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          obscureText: !_passwordVisible && widget.suffixVisibleText,
          keyboardType: widget.textInputType,
          enableSuggestions: false,
          autocorrect: false,
          focusNode: _focus,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: buildSuffix(),
              prefixIcon: widget.prefixIcon,
              // todo: definir no tema tanto suffix quanto prefix
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 40, maxWidth: 40)),
          validator: widget.validator,
        ),
      ],
    );
  }

  Widget? buildSuffix() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    } else if (widget.suffixVisibleText) {
      return IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          });
    }
    return null;
  }
}
