import 'package:employeesapp/models/contact_model.dart';
import 'package:employeesapp/res/components/profileImage/profile_image.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:employeesapp/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeDetailScreenView extends StatelessWidget {
  static const String path = "employeeDetailScreen";
  final EmployeeModel data;
  const EmployeeDetailScreenView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppbarCustom(
          backButtonRequired: true,
          title: "${data.firstName ?? ''} ${data.lastName ?? ''}"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding26),
            child: Column(
              children: [
                gapLarge,
                ProfileImage(
                  icon: "",
                  dbImage: data.profileImage ?? '',
                ),
                Text(
                  "${data.firstName ?? ''} ${data.lastName ?? ''}",
                  style: h4,
                ),
                Text(
                  data.status ?? '',
                  style: body1Medium,
                ),
                gapLarge,
                Card(
                  elevation: 0.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: w,
                    decoration: BoxDecoration(
                        color: ColorResources.backgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 0.2,
                            color: ColorResources.textfieldBordercolor)),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            titleandsubtile(
                                'Contact Number', data.mobile ?? ''),
                            titleandsubtile('Email', data.email ?? ''),
                          ],
                        ),
                        TableRow(
                          children: [
                            titleandsubtile('Date of Birth',
                                formatDate(data.dateOfBirth.toString() ?? '')),
                            titleandsubtile('Gender', data.gender ?? ""),
                          ],
                        ),
                        TableRow(children: [
                          titleandsubtile(
                              'Address', data.permanentAddress ?? ''),
                          const SizedBox(),
                        ])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableCell titleandsubtile(String title, subtile) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.left, // Align text to the left
          text: TextSpan(
            children: [
              TextSpan(
                  text: '$title\n',
                  style: heading1.copyWith(color: ColorResources.PRIMARY)),
              WidgetSpan(
                  child: SizedBox(
                height: 20,
              )),
              TextSpan(
                  text: subtile.toString(),
                  style: body1.copyWith(color: ColorResources.PRIMARY)),
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('MM-dd-yyyy').format(dateTime);
    return formattedDate;
  }
}
