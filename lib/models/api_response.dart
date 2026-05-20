

class ApiResponse<T> {
  int? statusCode;
  String? statusMessage;
  String? message;
  T? data;

  ApiResponse({this.statusCode, this.statusMessage, this.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse<T>(
      statusCode: json['statusCode'],
      statusMessage: json['statusMessage'],
      message: json['message'],
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) {
    return {
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}
