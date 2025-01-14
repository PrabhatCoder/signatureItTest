class CategoryResponse {
  List<Responsee>? response;
  bool? status;
  String? statusCode;
  String? message;

  CategoryResponse({this.response, this.status, this.statusCode, this.message});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['Response'] != null) {
      response = <Responsee>[];
      json['Response'].forEach((v) {
        response!.add(new Responsee.fromJson(v));
      });
    }
    status = json['Status'];
    statusCode = json['StatusCode'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['Response'] = this.response!.map((v) => v.toJson()).toList();
    }
    data['Status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['Message'] = this.message;
    return data;
  }
}

class Responsee {
  String? rootCategoryId;
  String? rootCategoryName;
  String? cotegoryImage;

  Responsee({this.rootCategoryId, this.rootCategoryName, this.cotegoryImage});

  Responsee.fromJson(Map<String, dynamic> json) {
    rootCategoryId = json['RootCategoryId'];
    rootCategoryName = json['RootCategoryName'];
    cotegoryImage = json['Cotegory_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RootCategoryId'] = this.rootCategoryId;
    data['RootCategoryName'] = this.rootCategoryName;
    data['Cotegory_Image'] = this.cotegoryImage;
    return data;
  }
}
