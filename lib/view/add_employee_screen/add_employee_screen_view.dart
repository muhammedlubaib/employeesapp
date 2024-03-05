// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:employeesapp/gen/assets.gen.dart';

import 'package:employeesapp/models/designation_model.dart';
import 'package:employeesapp/models/drop_down_model.dart';
import 'package:employeesapp/models/employee_add_params.dart';
import 'package:employeesapp/res/components/drop_down_menu/drop_down_menu.dart';
import 'package:employeesapp/res/components/profileImage/file_picker.dart';
import 'package:employeesapp/res/components/profileImage/profile_image.dart';
import 'package:employeesapp/res/log_info.dart';
import 'package:employeesapp/res/pagenation_model.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:employeesapp/utils/app_bar.dart';
import 'package:employeesapp/utils/general_utilis.dart';
import 'package:employeesapp/view_model/auth_view_model/auth_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEmployeeScreenView extends StatefulWidget {
  static const String path = "addemployeesscreen";
  const AddEmployeeScreenView({super.key});

  @override
  State<AddEmployeeScreenView> createState() => _AddEmployeeScreenViewState();
}

class _AddEmployeeScreenViewState extends State<AddEmployeeScreenView> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressnumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  int? designationId;
  TextEditingController genderController = TextEditingController();

  List<DropdownModel> genderList = [
    DropdownModel(id: 1, name: "Male"),
    DropdownModel(id: 2, name: "Female"),
    DropdownModel(id: 2, name: "Other")
  ];
  DropdownModel? selectedStudyLevel;
  DropdownModel? selectedGender;

  LoginProvider controller({required bool uiRender}) =>
      Provider.of(context, listen: uiRender);
  DateTime selectedDob = DateTime.now();
  Future<void> selectDOb(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      onDatePickerModeChange: (value) {
        //  print(value);
      },
      context: context,
      initialDate: selectedDob,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: ColorResources.PRIMARY
                // Customize your color here
                ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDob) {
      setState(() {
        selectedDob = pickedDate;
        dobController.text =
            _formatDate(pickedDate.toString().substring(0, 10));
        //_formatDate pickedDate.toString().substring(0, 10);
      });
    }
  }

  bool haveCvbool = false;

  String _formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
    return formattedDate;
  }

  File? selectedImag;
  File? selectedfile;

  bool checkvalidation = false;

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final loginFormkey = GlobalKey<FormState>();

  @override
  void initState() {
    // controller(uiRender: false).validateFrom(loginFormkey);
    pagingController.addPageRequestListener(_handlePageRequest);
    super.initState();
  }

  @override
  void dispose() {
    pagingController.removePageRequestListener(_handlePageRequest);

    super.dispose();
  }

  Future<void> _handlePageRequest(int pageKey) async {
    fetchPage(pageKey);
  }

  final PagingController<int, DesignationModel> pagingController =
      PagingController(firstPageKey: 1);
  Future<void> fetchPage(
    int pageKey,
  ) async {
    // print("testing anu 333");
    try {
      PaginationModel<DesignationModel> newItems =
          await Provider.of<LoginProvider>(context, listen: false)
              .designationlistApi(context: context, page: pageKey);

      final isLastPage = newItems.isLastPage;

      if (isLastPage) {
        pagingController.appendLastPage(newItems.newItems);
      } else {
        final nextPageKey = newItems.nextPage;
        pagingController.appendPage(newItems.newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarCustom(
          backButtonRequired: true,
          title: "Add an employee",
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(children: [
                        gapLarge,
                        ProfileImage(
                          icon: Assets.icon.editprofileCameraIcon,
                          onChanged: (selectedImage) {
                            // print(selectedImage.path);
                            selectedImag = selectedImage;
                            setState(() {});
                          },
                          // dbImage: data.profileImage ?? '',
                        ),
                        gap,
                        Visibility(
                          visible: selectedImag == null,
                          // &&
                          //     controller(uiRender: true).isValid),
                          child: Text(
                            "Please Upload Profile Image",
                            style: body1.red,
                          ),
                        ),
                        Form(
                          key: loginFormkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              gapLarge,
                              TextFieldCustom(
                                onChanged: (text) {
                                  // controller(uiRender: false)
                                  //     .validateFrom(loginFormkey);
                                },
                                hintText: "Enter Name",
                                labelText: "First Name",
                                isMandidatory: true,
                                controller: firstnameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please select First Name";
                                  }
                                  return null;
                                },
                              ),
                              TextFieldCustom(
                                onChanged: (text) {
                                  // controller(uiRender: false)
                                  //     .validateFrom(loginFormkey);
                                },
                                hintText: "Enter Name",
                                labelText: "Last Name",
                                isMandidatory: true,
                                controller: lastnameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please select Last Name";
                                  }
                                  return null;
                                },
                              ),
                              TextFieldCustom(
                                maxLength: 10,
                                hintText: "Enter Mobile Number",
                                labelText: "Mobile Number",
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter  Mobile Number";
                                  } else if (value.length < 10) {
                                    return "Please enter 10 digit Mobile Number";
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  if (text.length >= 10) {
                                    // controller(uiRender: false)
                                    //     .validateFrom(loginFormkey);
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                isMandidatory: true,
                                controller: mobilenumberController,
                              ),
                              TextFieldCustom(
                                hintText: "Enter Email Address",
                                labelText: "Email",
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                isMandidatory: true,
                                // validator: emailRegex,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter email id";
                                  } else if (!emailRegex.hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                },

                                controller: emailController,
                              ),
                              TextFieldCustom(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,

                                keyboardType: TextInputType.streetAddress,
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: "Enter address",
                                labelText: "address",
                                isMandidatory: true,
                                controller: addressnumberController,
                                maxLines: 5,
                                minLines: 3,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter Address";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done,
                              ),
                              TextFieldCustom(
                                onChanged: (text) {
                                  // controller(uiRender: false)
                                  //     .validateFrom(loginFormkey);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                readOnlyField: true,
                                suffixWidget: CupertinoButton(
                                    padding: const EdgeInsets.all(4),
                                    minSize: 0,
                                    onPressed: () {
                                      selectDOb(context);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.calendar,
                                      color: ColorResources.PRIMARY,
                                    )),
                                isMandidatory: true,
                                labelText: "Date of Birth",
                                hintText: "05/12/2020",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please select Date Of Birth";
                                  }
                                  return null;
                                },
                                controller: dobController,
                              ),
                              TextFieldCustom(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  isMandidatory: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please select Date Of Birth";
                                    }
                                    return null;
                                  },
                                  hintText: 'Select Designation',
                                  suffixWidget: const Icon(
                                    CupertinoIcons.chevron_down,
                                    color: ColorResources.PRIMARY,
                                  ),
                                  labelText: "Designation",
                                  controller: designationController,
                                  readOnlyField: true,
                                  onTap: () {
                                    showModal(context);
                                  }),
                              CustomDropdownButtonFormField(
                                labelText: 'Gender',
                                isMandidatory: true,
                                validator: (value) {
                                  if (selectedGender?.id == null) {
                                    return 'Please select Gender';
                                  }
                                  return null;
                                },
                                hintText: "select one",
                                value: selectedGender,
                                ismandiatory: true,
                                items: genderList,
                                onChanged: (value) {
                                  selectedGender = value as DropdownModel;
                                  setState(() {});

                                  controller(uiRender: false)
                                      .validateFrom(loginFormkey);
                                },
                              ),
                              gap,
                              GestureDetector(
                                onTap: () async {
                                  selectedfile = await filepicker();

                                  if (selectedfile != null) {
                                    haveCvbool = true;
                                    loginFormkey.currentState!.validate();
                                    setState(() {});
                                  }
                                },
                                child: Stack(
                                  children: [
                                    TextFieldCustom(
                                      validator: (value) {
                                        if (selectedfile == null) {
                                          return "please pick cv";
                                        }
                                        setState(() {});
                                        return null;
                                      },
                                      labelText: 'Select Resume',
                                      isMandidatory: true,
                                      hintText: "",
                                      maxLines: 5,
                                      minLines: 5,
                                      readOnlyField: true,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    ),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(haveCvbool
                                                ? Assets.icon.pdficon
                                                : Assets.icon.uploadarrowicon),
                                            gap,
                                            Text(
                                              "upload file in pdf format",
                                              style: body1Medium.grey2,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              gapXL,
                              Consumer<LoginProvider>(
                                  builder: (context, controllers, _) {
                                return SubmitButton(
                                  isEnabled: checkData(),
                                  //controller(uiRender: true).isValid,
                                  "Save",
                                  showLoader: controllers.employeeAddLoading,
                                  onTap: (value) {
                                    loginFormkey.currentState!.validate();
                                    if (loginFormkey.currentState!.validate()) {
                                      saveFunction();
                                    } else {
                                      checkvalidation = true;
                                      setState(() {});
                                      logWarning("failed");

                                      HapticFeedback.heavyImpact();
                                    }
                                  },
                                );
                              })
                            ],
                          ),
                        )
                      ]);
                    })))));
  }

  saveFunction() {
    logWarning("done");
    HapticFeedback.selectionClick();
    Provider.of<LoginProvider>(context, listen: false).employyeaddapi(
        context: context,
        params: EmployeeaddParams(
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          joinDate: selectedDob,
          dateOfBirth: selectedDob,
          //dobController.text,
          designationId: designationId,
          //designationId,
          gender: selectedGender?.name,
          email: emailController.text,
          mobile: int.parse(mobilenumberController.text),
          landline: int.parse(mobilenumberController.text),
          presentAddress: addressnumberController.text,
          permanentAddress: addressnumberController.text,
          status: 'TEMPORERY',
          profilePicture: selectedImag,
          resume: selectedfile,
        ));
    // Navigator.pop(context);
  }

  bool checkData() {
    if (firstnameController != null &&
        (lastnameController.text != null && lastnameController.text != '') &&
        selectedDob != null &&
        designationId != null &&
        selectedGender != null &&
        (emailController.text != null && emailController.text != '') &&
        (mobilenumberController.text != null &&
            mobilenumberController.text != '') &&
        (addressnumberController.text != null &&
            addressnumberController.text != '') &&
        selectedImag != null &&
        selectedfile != null) {
      return true;
    }
    return false;
  }

  Future<File?> filepicker() async {
    File? file = await FilePickerService().pickFile(
      fileType: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );
    return file;
  }

  void showModal(context) {
    double h = MediaQuery.of(context).size.height;
    // changeSystemColor(Colors.pink);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return SafeArea(
              child: Container(
                  height: h * 2 / 3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  width: double.infinity,
                  child: PagedListView(
                      pagingController: pagingController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      builderDelegate: PagedChildBuilderDelegate<
                              DesignationModel>(
                          firstPageErrorIndicatorBuilder: (context) => Center(
                              child: Text(pagingController.error.toString())),
                          noItemsFoundIndicatorBuilder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.icon.checkMark1,
                                    height: 200,
                                  ),
                                  gapSmall,
                                  Text("No posts found", style: body2),
                                  gapSmall,
                                ],
                              ),
                          firstPageProgressIndicatorBuilder: (context) =>
                              const SpinKitCircle(
                                color: Colors.white,
                                // size: 40.0 - widget.padding / 2.5,
                              ),
                          itemBuilder: (context, item, index) {
                            return Column(children: [
                              ListTile(
                                onTap: () {
                                  mystate(() {
                                    designationId = item.id;
                                    designationController.text =
                                        item.name ?? "";
                                  });
                                  Navigator.pop(context);
                                },
                                leading: CircleAvatar(
                                    backgroundColor: ColorResources.grey6,
                                    radius: 13,
                                    child: (designationId == item.id)
                                        ? SvgPicture.asset(
                                            Assets.icon.checkMark1)
                                        : const SizedBox()),
                                title: Text(item.name ?? '',
                                    style: body1Medium600.copyWith()),
                              )
                            ]);
                          }))),
            );
          });
        });
  }
}
