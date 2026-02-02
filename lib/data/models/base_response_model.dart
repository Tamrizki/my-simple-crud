class BaseResponse<T> {
  final T data;
  final int? code;
  final String? message;

  const BaseResponse({required this.data, required this.code, this.message});

  static BaseResponse<T> fromJson<T>({
    required Map<String, dynamic> json,
    required T Function(Object? json) parseData,
  }) {
    return BaseResponse<T>(
      data: parseData(json['data']),
      code: (json['code'] as num).toInt(),
      message: json['message'] as String?,
    );
  }
}
