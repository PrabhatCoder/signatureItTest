import 'dart:ffi';

class DetailsReponse {
  List<DetailsData>? response;
  bool? status;
  String? statusCode;
  String? message;

  DetailsReponse({this.response, this.status, this.statusCode, this.message});

  DetailsReponse.fromJson(Map<String, dynamic> json) {
    if (json['Response'] != null) {
      response = <DetailsData>[];
      json['Response'].forEach((v) {
        response!.add(new DetailsData.fromJson(v));
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

class DetailsData {
  int? productId;
  String? productName;
  String? productCode;
  String? productDescription;
  String? productSDescription;
  double? regularPrice;
  double? salePrice;
  String? imgActualImage;
  String? proImage;
  Null? mainCatId;
  Null? orderlimit;

  DetailsData(
      {this.productId,
        this.productName,
        this.productCode,
        this.productDescription,
        this.productSDescription,
        this.regularPrice,
        this.salePrice,
        this.imgActualImage,
        this.proImage,
        this.mainCatId,
        this.orderlimit});

  DetailsData.fromJson(Map<String, dynamic> json) {
    productId = json['Product_Id'];
    productName = json['Product_Name'];
    productCode = json['Product_Code'];
    productDescription = json['Product_Description'];
    productSDescription = json['Product_S_Description'];
    regularPrice = json['Regular_Price'];
    salePrice = json['Sale_Price'];
    imgActualImage = json['Img_Actual_Image'];
    proImage = json['Pro_Image'];
    mainCatId = json['Main_Cat_Id'];
    orderlimit = json['Orderlimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product_Id'] = this.productId;
    data['Product_Name'] = this.productName;
    data['Product_Code'] = this.productCode;
    data['Product_Description'] = this.productDescription;
    data['Product_S_Description'] = this.productSDescription;
    data['Regular_Price'] = this.regularPrice;
    data['Sale_Price'] = this.salePrice;
    data['Img_Actual_Image'] = this.imgActualImage;
    data['Pro_Image'] = this.proImage;
    data['Main_Cat_Id'] = this.mainCatId;
    data['Orderlimit'] = this.orderlimit;
    return data;
  }
}
