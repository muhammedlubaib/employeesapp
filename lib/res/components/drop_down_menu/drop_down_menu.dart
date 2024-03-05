// import 'package:employeesapp/res/style/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class DropdownButtonExample extends StatefulWidget {
//   DropdownButtonExample({super.key, required this.listofData});
//   List listofData = [];

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   @override
//   Widget build(BuildContext context) {
//     String dropdownValue = 'select One';
//     // 'widget.listofData.firs't;

//     return DropdownButton<String>(
//       isDense: true,
//       borderRadius: BorderRadius.circular(12.0),
//       value: dropdownValue,
//       // icon: SvgPicture.asset(Assets.icon.dropdownArrow.keyName),
//       elevation: 16,
//       alignment: AlignmentDirectional.topEnd,
//       style: heading1.primary,
//       underline: const SizedBox(),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

// const List<String> list = <String>[
//   'Kerala  ',
//   'India  ',
//   'International  ',
// ];

import 'package:employeesapp/gen/assets.gen.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropdownButtonFormField<T> extends StatefulWidget {
  CustomDropdownButtonFormField(
      {Key? key,
      this.labelText,
      this.hintText,
      required this.items,
      required this.onChanged,
      this.value,
      this.validator,
      this.contentPadding,
      this.color,
      this.ismandiatory,
      this.prefixWidget,
      this.dismissBorder = false,
      this.suffixWidget,
      this.suffix,
      this.prefixStyle,
      this.prefixText,
      this.isMandidatory})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final List<T> items;
  final Color? color;
  bool? ismandiatory = true;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final EdgeInsets? contentPadding;
  final FormFieldValidator? validator;
  final bool dismissBorder;

  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Widget? suffix;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final bool? isMandidatory;

  @override
  State<CustomDropdownButtonFormField<T>> createState() =>
      _CustomDropdownButtonFormFieldState<T>();
}

class _CustomDropdownButtonFormFieldState<T>
    extends State<CustomDropdownButtonFormField<T>> {
  FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.isMandidatory ?? false)
            ? Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8, top: 12),
                child: RichText(
                    text: TextSpan(
                        style: body1Medium600.primary,
                        text: widget.labelText,
                        children: const [
                      TextSpan(
                          text: ' *',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: ColorResources.errorStyle))
                    ])),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                child: Text(widget.labelText ?? '', style: body1Medium600),
              ),
        DropdownButtonFormField<T>(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          icon: SizedBox(),
          borderRadius: BorderRadius.circular(18.0),
          decoration: defaultInputDecoration.copyWith(
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(color: ColorResources.errorStyle),
            prefixIcon: widget.prefixWidget,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorResources.primary),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      //  Icons.keyboard_arrow_down,
                      color: ColorResources.PRIMARY,
                    ),
                  )),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: ColorResources.GREY),
            suffix: widget.suffix,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle,
            contentPadding: const EdgeInsets.all(20.0),
          ),

          //SvgPicture.asset(Assets.icon.fiSrAngleSmallDown),

          // 'assets/icons/fi-sr-angle-small-down.svg'
          // decoration: InputDecoration(
          //   label: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text(widget.labelText!),
          //       (widget.ismandiatory == true)
          //           ? Text(
          //               widget.ismandiatory! ? " *" : '',
          //               style: Tstyle.errortstyle12400.copyWith(fontSize: 20),
          //             )
          //           : const SizedBox()
          //     ],
          //   ),
          //   // errorText: 'please select your nearest branch',
          //   // labelText: widget.labelText,
          //   floatingLabelStyle: myFocusNode.hasFocus
          //       ? textStyleDropDown(widget.color)
          //       : Tstyle.loginScreenSubTextStyle,
          //   labelStyle: Tstyle.loginScreenSubTextStyle,
          //   // focusColor: myFocusNode.hasFocus ? Colors.deepOrange : Colors.black,
          //   // labelStyle: myFocusNode.hasFocus
          //   //     ? GoogleFont.greenColorLableStyleOnFocus
          //   //     : GoogleFont.greenColorLableStyle,
          //   hintText: widget.hintText,
          //   hintStyle: Tstyle.phonenUmberTextStyleInactive,
          //   floatingLabelBehavior: FloatingLabelBehavior.always,
          //   // border: OutlineInputBorder(
          //   //   borderRadius: BorderRadius.circular(10),
          //   // ),
          //   border: OutlineInputBorder(
          //     borderSide: BorderSide(color: SkymarkColors.greyColor, width: 1),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: SkymarkColors.lightGrey, width: 1),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       borderSide: BorderSide(
          //         color: widget.color ?? SkymarkColors.primaryColorBlue2E,
          //       )),

          //   contentPadding:
          //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          // ),
          alignment: widget.dismissBorder
              ? Alignment.centerRight
              : Alignment.centerLeft,
          items: widget.items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Builder(builder: (context) {
                      String text = e.toString();
                      if (e is MapEntry<String, int>) {
                        text = e.key;
                      }
                      return Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: ColorResources.grey6,
                              radius: 13,
                              child: (e.toString() == widget.value.toString())
                                  ? SvgPicture.asset(Assets.icon.checkMark1)
                                  : const SizedBox()),
                          gapHorizontal,
                          Text(text, style: body1Medium600.copyWith()),
                        ],
                      );
                    }),
                  ))
              .toList(),
          selectedItemBuilder: (context) {
            return widget.items.map((e) => Text(e.toString())).toList();
          },
          value: widget.value,
          onChanged: widget.onChanged,
          validator: widget.validator,
        )
      ],
    );
  }

  TextStyle textStyleDropDown(Color? color) {
    if (color == null) {
      return greenColorLableStyleOnFocus;
    } else {
      return blueColorLableStyleOnFocus;
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
            borderSide: const BorderSide(
                width: 1, color: ColorResources.textfieldBordercolor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                width: 1, color: ColorResources.textfieldBordercolor)),
      );
}
