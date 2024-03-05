import 'dart:io';

import 'package:dio/dio.dart';

class EmployeeaddParams {
  String? firstName;
  String? lastName;
  DateTime? joinDate;
  DateTime? dateOfBirth;
  int? designationId;
  String? gender;
  String? email;
  int? mobile;
  int? landline;
  String? presentAddress;
  String? permanentAddress;
  String? status;
  File? profilePicture;
  File? resume;

  EmployeeaddParams({
    this.firstName,
    this.lastName,
    this.joinDate,
    this.dateOfBirth,
    this.designationId,
    this.gender,
    this.email,
    this.mobile,
    this.landline,
    this.presentAddress,
    this.permanentAddress,
    this.status,
    this.profilePicture,
    this.resume,
  });

  Future<FormData> toFormData() async {
    MultipartFile? formProfileImage;
    MultipartFile? resumeFile;
    if (profilePicture != null) {
      formProfileImage = await MultipartFile.fromFile(profilePicture!.path);
    }

    if (resume != null) {
      resumeFile = await MultipartFile.fromFile(resume!.path);
    }
    // MultipartFile formReraCertificate =
    //     await MultipartFile.fromFile(rereCertificate!.path);
    Map<String, dynamic> mapData = {};

    mapData = {
      "first_name": firstName,
      "last_name": lastName,
      "join_date":
          "${joinDate!.year.toString().padLeft(4, '0')}-${joinDate!.month.toString().padLeft(2, '0')}-${joinDate!.day.toString().padLeft(2, '0')}",
      "date_of_birth":
          "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
      "designation_id": designationId,
      "gender": gender,
      "email": email,
      "mobile": mobile,
      "landline": landline,
      "present_address": presentAddress,
      "permanent_address": permanentAddress,
      "status": status,
      "profile_picture": formProfileImage,
      "resume": resumeFile,
    };

    return FormData.fromMap(mapData);
  }
}
