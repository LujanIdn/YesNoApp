import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final respone = await _dio.get('https://yesno.wtf/api');

    final yesnoModel = YesnoModel.fromJsonMap(respone.data);

    return yesnoModel.tomessageEntity();
  }
}
