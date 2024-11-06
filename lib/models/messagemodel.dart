import 'package:chatapp/constants.dart';

class MessageModel {
  final String message;
  MessageModel(this.message);
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData[messagecolletion]);
  }
}
