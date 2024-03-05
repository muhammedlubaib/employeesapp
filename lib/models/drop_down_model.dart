class DropdownModel {
    int? id;
    String? name;

    DropdownModel({
        this.id,
        this.name,
    });

    factory DropdownModel.fromJson(Map<String, dynamic> json) => DropdownModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
    @override
  String toString() {
    
    return name ??'';
  }
}