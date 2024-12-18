import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class GlobalControllerModel extends Equatable {
  final int id;

  final String accessToken;

  const GlobalControllerModel({
    required this.accessToken,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'id': id,
    };
  }

  static GlobalControllerModel empty() {
    return const GlobalControllerModel(
      accessToken: '',
      id: -1,
    );
  }

  String toMapString() {
    return jsonEncode(toMap());
  }

  static GlobalControllerModel fromMap(Map<String, dynamic> map) {
    return GlobalControllerModel(
      accessToken: map['access_token'],
      id: map['id'],
    );
  }

  GlobalControllerModel copyWith({
    String? accessToken,
    int? id,
  }) {
    return GlobalControllerModel(
      accessToken: accessToken ?? this.accessToken,
      id: id ?? this.id,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        accessToken,
        id,
      ];
}
