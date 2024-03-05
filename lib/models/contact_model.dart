
import 'dart:convert';

class PhoneNumberModel {
  final String name;
  final String email;
  final DateTime dob;
  final String gender;
  final String profileImage;
  final String phoneNumber;
  final String designation;
  final String address;

  PhoneNumberModel(
      {required this.dob,
      required this.email,
      required this.designation,
      required this.gender,
      required this.address,
      required this.name,
      required this.profileImage,
      required this.phoneNumber});
}



// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);



EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
    int id;
    String firstName;
    String lastName;
    DateTime joinDate;
    DateTime dateOfBirth;
    int designationId;
    String gender;
    int mobile;
    int landline;
    String email;
    String presentAddress;
    String permanentAddress;
    String profilePicture;
    String resume;
    DateTime createdAt;
    DateTime updatedAt;
    String status;
    String profileImage;

    EmployeeModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.joinDate,
        required this.dateOfBirth,
        required this.designationId,
        required this.gender,
        required this.mobile,
        required this.landline,
        required this.email,
        required this.presentAddress,
        required this.permanentAddress,
        required this.profilePicture,
        required this.resume,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
        required this.profileImage,
    });

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        joinDate: DateTime.parse(json["join_date"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        designationId: json["designation_id"],
        gender: json["gender"],
        mobile: json["mobile"],
        landline: json["landline"],
        email: json["email"],
        presentAddress: json["present_address"],
        permanentAddress: json["permanent_address"],
        profilePicture: json["profile_picture"],
        resume: json["resume"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "join_date": joinDate.toIso8601String(),
        "date_of_birth": dateOfBirth.toIso8601String(),
        "designation_id": designationId,
        "gender": gender,
        "mobile": mobile,
        "landline": landline,
        "email": email,
        "present_address": presentAddress,
        "permanent_address": permanentAddress,
        "profile_picture": profilePicture,
        "resume": resume,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "profile_image": profileImage,
    };
}
