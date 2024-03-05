import 'dart:io';

import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {Key? key,
      this.controller,
      this.prefixWidget,
      this.labelText,
      this.hintText,
      this.suffixWidget,
      this.readOnlyField,
      this.onTap,
      this.keyboardType,
      this.isEnabled = true,
      this.obscure = false,
      this.labelColor,
      this.fillColor,
      this.enableBorder = true,
      this.textAlign = TextAlign.start,
      this.height = 54,
      this.contentPadding,
      this.maxLines = 1,
      this.minLines = 1,
      this.labelStyle,
      this.validator,
      this.textInputAction,
      this.prefix,
      this.suffix,
      this.onChanged,
      this.focusNode,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.style,
      this.prefixStyle,
      this.prefixText,
      this.initialValue,
      this.maxLength,
      this.autofocus,
      this.showCounter = false,
      this.autovalidateMode,
      this.isMandidatory,
      this.englishTestField,
      this.perctangeField,
      this.enableSuggestions})
      : super(key: key);
  final bool? isMandidatory;
  final TextEditingController? controller;
  final Widget? prefixWidget;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixWidget;
  final bool? readOnlyField;
  final Function? onTap;
  final bool isEnabled;
  final bool obscure;
  final TextAlign textAlign;
  final Color? labelColor;
  final Color? fillColor;
  final bool enableBorder;
  final double height;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String text)? onChanged;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final TextStyle? style;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final String? initialValue;
  final bool showCounter;
  final bool? autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool? enableSuggestions;
  final bool? englishTestField;
  final bool? perctangeField;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (isMandidatory ?? false) && (labelText != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8, top: 12),
                    child: RichText(
                        text: TextSpan(
                            style: body1Medium600.primary,
                            text: labelText,
                            children: const [
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: ColorResources.errorStyle))
                        ])),
                  )
                : labelText != null
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                        child: Text(labelText ?? '', style: body1Medium600),
                      )
                    : SizedBox(),
            TextFormField(
              focusNode: focusNode,
              onChanged: onChanged,
              initialValue: initialValue,
              maxLength: maxLength ??
                  ((keyboardType == TextInputType.name ||
                          keyboardType == TextInputType.emailAddress)
                      ? 30
                      : keyboardType == TextInputType.phone
                          ? 10
                          : null),
              buildCounter: (
                context, {
                required currentLength,
                required isFocused,
                maxLength,
              }) {
                if (!isFocused || !showCounter) {
                  return null;
                }

                return Text(
                  '$currentLength/$maxLength',
                  //  style: caption.black,
                );
              },
              autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
              autofocus: autofocus ?? false,
              onFieldSubmitted: onFieldSubmitted,
              onEditingComplete: onEditingComplete,
              maxLines: maxLines,
              minLines: minLines,
              enableSuggestions: enableSuggestions ?? true,
              obscureText: obscure,
              enabled: isEnabled,
              onTap: () => onTap == null ? null : onTap!(),
              readOnly: readOnlyField ?? false,
              controller: controller,
              validator: validator,
              textAlign: textAlign,
              keyboardType: keyboardType ?? TextInputType.name,
              // style: style ??
              //     body1.copyWith(
              //         color: isEnabled ? ColorResources.BLACK : ColorResources.grey6),
              // cursorColor: ColorResources.BLACK,
              textInputAction: textInputAction,
              // scrollPadding: EdgeInsets.only(bottom: (Platform.isIOS) ? 80 : 0),
              inputFormatters: [
                if (keyboardType == TextInputType.phone)
                  FilteringTextInputFormatter.digitsOnly,
                if (keyboardType == TextInputType.name)
                  FilteringTextInputFormatter.deny(RegExp(r"\s")),

                // if (obscure) LengthLimitingTextInputFormatter(5),
                if (obscure)
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9@!?_]+')),
                // if (englishTestField ?? false)
                //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}$')),
                // if (englishTestField ?? false) MaxValueTextInputFormatter(9),
                // if (perctangeField ?? false) MaxValueTextInputFormatter(100),
              ],
              decoration: defaultInputDecoration.copyWith(
                // floatingLabelAlignment: ,
                //labelText: labelText,
                // label: (isMandidatory ?? false)
                //     ? RichText(
                //         text: TextSpan(
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w400,
                //                 color: ColorResources.primary),
                //             text: labelText,
                //             children: [
                //             TextSpan(
                //                 text: ' *',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.w400,
                //                     color: ColorResources.errorStyle))
                //           ]))
                //     : Text(
                //         labelText ?? '',
                //         style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.w400,
                //             color: ColorResources.primary),
                //       ),

                // labelStyle: body1.black.copyWith(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w400,
                //     color: ColorResources.PRIMARY),

                filled: true,
                fillColor: Colors.white,
                prefix: prefix,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: const TextStyle(color: ColorResources.GREY),
                prefixIcon: prefixWidget,
                suffixIcon: Visibility(
                    visible: suffixWidget != null,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorResources.primary),
                          child: suffixWidget),
                    )),
                errorStyle: const TextStyle(color: ColorResources.errorStyle),
                suffix: suffix,
                prefixText: prefixText,
                prefixStyle: prefixStyle,
                contentPadding: const EdgeInsets.all(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration get defaultInputDecoration => InputDecoration(
      errorStyle: const TextStyle(color: ColorResources.errorStyle),
      hintStyle: const TextStyle(color: ColorResources.GREY),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              width: 1, color: ColorResources.textfieldBordercolor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              width: 1, color: ColorResources.textfieldBordercolor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              const BorderSide(width: 1, color: ColorResources.primary)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1, color: Color(0xffD9DBE9))),
    );

// class SubmitButton extends StatefulWidget {
//   const SubmitButton(this.title,
//       {Key? key,
//       this.onTap,
//       this.padding = 14,
//       this.backgroundColor = ColorResources.buttonColor,
//       this.textColor = Colors.white,
//       this.overlayColor = Colors.white,
//       this.textStyle,
//       this.borderColor,
//       this.radius,
//       this.suffix,
//       this.showLoader})
//       : super(key: key);

//   const SubmitButton.disabled(
//     this.title, {
//     Key? key,
//     this.onTap,
//     this.padding = 14,
//     this.backgroundColor = ColorResources.GREY,
//     this.textColor = Colors.white,
//     this.overlayColor = Colors.white,
//     this.textStyle,
//     this.borderColor,
//     this.radius,
//     this.suffix,
//     this.showLoader,
//   }) : super(key: key);

//   final ValueChanged<VoidCallback>? onTap;
//   final String title;
//   final double padding;
//   final Color? textColor;
//   final Color? borderColor;
//   final BorderRadius? radius;
//   final Widget? suffix;
//   final Color backgroundColor;
//   final Color overlayColor;
//   final TextStyle? textStyle;
//   final bool? showLoader;

//   @override
//   State<SubmitButton> createState() => _SubmitButtonState();
// }

// class _SubmitButtonState extends State<SubmitButton>
//     with TickerProviderStateMixin {
//   bool showLoader = false;
//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     showLoader = widget.showLoader ?? false;
//     setState(() {});
//     return SizedBox(
//       height: 54,
//       child: TextButton(
//         onPressed: showLoader
//             ? null
//             : () => widget.onTap!(() {
//                   setState(() {
//                     showLoader = !showLoader;
//                   });
//                 }),
//         style: TextButton.styleFrom(
//           padding: EdgeInsets.symmetric(
//             horizontal: widget.padding,
//           ),
//           // backgroundColor: widget.backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: widget.radius ?? BorderRadius.circular(16),
//           ),
//         ).copyWith(
//           overlayColor: MaterialStatePropertyAll(
//             widget.overlayColor.withOpacity(0.1),
//           ),
//           backgroundColor: MaterialStateProperty.resolveWith(
//             (states) {
//               if (states.contains(MaterialState.disabled)) {
//                 return ColorResources.buttonColor;
//               }
//               return widget.backgroundColor;
//             },
//           ),
//         ),
//         child: showLoader
//             ? SpinKitCircle(
//                 color: Colors.white,
//                 size: 40.0 - widget.padding / 2.5,
//               )
//             : Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (widget.suffix != null) ...[widget.suffix!, gap],
//                   Expanded(
//                     child: Text(
//                       widget.title,
//                       // maxLines: 1,
//                       // overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       // style: (widget.textStyle ?? buttonText).copyWith(
//                       //   color: widget.textColor,
//                       // ),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

class SubmitButton extends StatefulWidget {
  const SubmitButton(this.title,
      {Key? key,
      this.onTap,
      this.padding = 14,
      this.backgroundColor = ColorResources.buttonColor,
      this.textColor = Colors.white,
      this.overlayColor = Colors.white,
      this.textStyle,
      this.borderColor,
      this.radius,
      this.suffix,
      this.isEnabled,
      this.showLoader})
      : super(key: key);

  const SubmitButton.disabled(this.title,
      {Key? key,
      this.onTap,
      this.padding = 14,
      this.backgroundColor = ColorResources.GREY3,
      this.textColor = Colors.white,
      this.overlayColor = Colors.white,
      this.textStyle,
      this.borderColor,
      this.radius,
      this.suffix,
      this.showLoader,
      this.isEnabled})
      : super(key: key);

  final ValueChanged<VoidCallback>? onTap;
  final String title;
  final double padding;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadius? radius;
  final Widget? suffix;
  final Color backgroundColor;
  final Color overlayColor;
  final TextStyle? textStyle;
  final bool? showLoader;
  final bool? isEnabled;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton>
    with TickerProviderStateMixin {
  bool showLoader = false;
  // bool isEnabled = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showLoader = widget.showLoader ?? false;
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: SizedBox(
        height: 60,
        child: TextButton(
          onPressed: (widget.isEnabled ?? false)
              ? showLoader
                  ? null
                  : () => widget.onTap!(() {
                        setState(() {
                          showLoader = !showLoader;
                        });
                      })
              : null,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: widget.padding,
            ),
            // backgroundColor: widget.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: widget.radius ?? BorderRadius.circular(16),
            ),
          ).copyWith(
            overlayColor: MaterialStatePropertyAll(
              widget.overlayColor.withOpacity(0.1),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return ColorResources.BORDER;
                }
                return widget.backgroundColor;
              },
            ),
          ),
          child: showLoader
              ? SpinKitCircle(
                  color: Colors.white,
                  size: 40.0 - widget.padding / 2.5,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.suffix != null) ...[widget.suffix!, gap],
                    Expanded(
                      child: Text(
                        widget.title,
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: (widget.textStyle ?? buttonText).copyWith(
                          color: widget.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
