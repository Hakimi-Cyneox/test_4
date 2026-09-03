// To parse this JSON data, do
//
//     final result = resultFromMap(jsonString);

import 'dart:convert';

// todo: tune this class based on the required requirement

class Result<T> {
  Result({
    this.status,
    this.code,
    this.text,
    this.message,
    this.isError = false,
    this.body,
    this.pagination,
    this.error,
    this.accessToken,
    this.expired = false,
    this.dropdown,
    this.validVersion,
  });

  bool? status;
  int? code;
  String? message;
  bool? isError;
  String? text;
  var error;
  String? accessToken;
  bool? expired;
  Map<String, dynamic>? dropdown;
  bool? validVersion;

  /// TO PARSE INTO MODEL USE .fromMap()
  T? body;
  T? pagination;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    status: json["status"],
    code: json["code"],
    text: json["text"],
    message: json["message"],
    error: json["error"],
    accessToken: json["access_token"],
    expired: json["expired"],
    dropdown: json["dropdown"],
    validVersion: json["valid_version"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "code": code,
    "text": text,
    "message": message,
    "error": error,
    "access_token": accessToken, // need to update this token everytime calling new api
    "expired": expired, // will return as true if user account session timeout
    "dropdown": dropdown,
    "valid_version": validVersion,
  };
}
