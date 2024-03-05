// To parse this JSON data, do
//
//     final designationModel = designationModelFromJson(jsonString);

import 'dart:convert';

DesignationModel designationModelFromJson(String str) => DesignationModel.fromJson(json.decode(str));

String designationModelToJson(DesignationModel data) => json.encode(data.toJson());

class DesignationModel {
    int? id;
    String? name;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    DesignationModel({
        this.id,
        this.name,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
