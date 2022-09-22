class Data {
  String? message;
  Response? response;

  Data({this.message, this.response});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  int? puissance;
  int? tension;
  int? courant;
  int? temperature;

  Response({this.puissance, this.tension, this.courant, this.temperature});

  Response.fromJson(Map<String, dynamic> json) {
    puissance = json['puissance'];
    tension = json['Tension'];
    courant = json['Courant'];
    temperature = json['Temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['puissance'] = this.puissance;
    data['Tension'] = this.tension;
    data['Courant'] = this.courant;
    data['Temperature'] = this.temperature;
    return data;
  }
}
