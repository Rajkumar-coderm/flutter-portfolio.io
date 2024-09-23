import 'dart:convert';

class VisitorsRequestDataModel {
  factory VisitorsRequestDataModel.fromMap(Map<String, dynamic> map) =>
      VisitorsRequestDataModel(
        name: map['name'] != null ? map['name'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        subject: map['subject'] != null ? map['subject'] as String : null,
        message: map['message'] != null ? map['message'] as String : null,
      );

  factory VisitorsRequestDataModel.fromJson(String source) =>
      VisitorsRequestDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
  VisitorsRequestDataModel({
    this.name,
    this.email,
    this.subject,
    this.message,
  });

  final String? name;
  final String? email;
  final String? subject;
  final String? message;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      };

  String toJson() => json.encode(toMap());
}
