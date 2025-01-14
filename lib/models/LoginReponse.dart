class LoginReponse {
  List<Response>? response;
  bool? status;
  String? statusCode;
  String? message;

  LoginReponse({this.response, this.status, this.statusCode, this.message});

  LoginReponse.fromJson(Map<String, dynamic> json) {
    if (json['Response'] != null) {
      response = <Response>[];
      json['Response'].forEach((v) {
        response!.add(new Response.fromJson(v));
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

class Response {
  String? oTP;

  Response({this.oTP});

  Response.fromJson(Map<String, dynamic> json) {
    oTP = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OTP'] = this.oTP;
    return data;
  }
}
