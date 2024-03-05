import 'package:dartz/dartz.dart';

import 'app_error.dart';

abstract class UseCase<Output, Input> {
  Future<Either<AppError, ResponseWrap<Output>>> call(Input params);
}

class ResponseWrap<T> {
  final String message;
  final bool status;
  final T? data;

  ResponseWrap({
    required this.message,
    required this.status,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'data': data,
    };
  }

  factory ResponseWrap.fromMap(Map<String, dynamic> map, {T? data}) {
    return ResponseWrap<T>(
      message: map['message'] ?? "ok",
      status: map['status'] == true ? true : map["status"] ?? false,
      data: data,
    );
  }
}
