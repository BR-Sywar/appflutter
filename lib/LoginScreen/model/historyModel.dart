class HistoryModel {
  String? message;
  List<Response>? response;

  HistoryModel({this.message, this.response});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? sId;
  int? puissance;
  int? tension;
  int? courant;
  int? temperature;
  String? date;
  int? iV;

  Response(
      {this.sId,
      this.puissance,
      this.tension,
      this.courant,
      this.temperature,
      this.date,
      this.iV});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    puissance = json['puissance'];
    tension = json['tension'];
    courant = json['courant'];
    temperature = json['temperature'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['puissance'] = this.puissance;
    data['tension'] = this.tension;
    data['courant'] = this.courant;
    data['temperature'] = this.temperature;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
