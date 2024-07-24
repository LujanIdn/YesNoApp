// To parse this JSON data, do
//
//     final yesnoModel = yesnoModelFromJson(jsonString);

import 'package:yes_no_app/domain/entities/message.dart';

class YesnoModel {
  final String answer;
  final bool forced;
  final String image;

  YesnoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesnoModel.fromJsonMap(Map<String, dynamic> json) => YesnoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message tomessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image);
}
