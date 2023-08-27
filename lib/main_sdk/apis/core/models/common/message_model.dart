import 'dart:convert';

class MessageModel {
  String message;
  bool success;
  dynamic results;

  MessageModel(
      {this.message = 'Unknown Error', this.success = false, this.results});

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel.fromMap(json);

  String toJson() => json.encode(toMap());

  // factory MessageModel.EmptyMessageSuccess() => MessageModel(isSuccess: true);

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        message: json['message'] ?? 'Unknown Error',
        success: json['success'] ?? false,
        results: json['results'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'success': success,
        'results': results,
      };
}
