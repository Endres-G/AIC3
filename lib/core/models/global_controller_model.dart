import 'dart:convert';

import 'package:equatable/equatable.dart';

class GlobalControllerModel extends Equatable {
  final int? id;
  final String? businessName;
  final String? email;
  final String? profileImage;
  final String? coverImage;
  final String? minOrderValue;

  const GlobalControllerModel({
    this.id,
    this.businessName,
    this.email,
    this.profileImage,
    this.coverImage,
    this.minOrderValue,
  });

  // Converte o modelo para um mapa (para enviar para API ou salvar no localStorage)
  Map<String, dynamic> toMapForSession() {
    return {
      'id': id,
      'businessName': businessName,
      'email': email,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };
  }

  Map<String, dynamic> toMapForApi() {
    return {
      'profileImage': profileImage,
      'coverImage': coverImage,
    };
  }

  // Converte o mapa de volta para o modelo
  static GlobalControllerModel fromMap(Map<String, dynamic> map) {
    return GlobalControllerModel(
      id: map['id'],
      businessName: map['businessName'],
      email: map['email'],
      profileImage: map['profileImage'],
      coverImage: map['coverImage'],
      minOrderValue: map['minOrderValue'] ?? "0.0",
    );
  }

  // Cria uma versão vazia do modelo
  static GlobalControllerModel empty() {
    return const GlobalControllerModel(
      id: -1,
      businessName: '',
      email: '',
      profileImage: '',
      coverImage: '',
      minOrderValue: "0.0",
    );
  }

  // Retorna o modelo como uma string JSON
  String toMapString() {
    return jsonEncode(toMapForSession());
  }

  // Método para criar uma cópia do modelo com novos valores
  GlobalControllerModel copyWith({
    int? id,
    String? businessName,
    String? email,
    String? profileImage,
    String? coverImage,
  }) {
    return GlobalControllerModel(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      coverImage: coverImage ?? this.coverImage,
    );
  }

  @override
  List<Object?> get props => [
        id,
        businessName,
        email,
        profileImage,
        coverImage,
      ];
}
