class AuthModel {
  final String email;
  final String password;
  final String? businessName;
  final String? cnpj;
  final bool? isActive;
  final String userType;

  AuthModel({
    this.isActive,
    this.businessName,
    this.cnpj,
    required this.email,
    required this.password,
    this.userType = "factory",
  });

  // Método para converter o objeto para um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'email': email,
      'password': password,
      'cnpj': cnpj,
      'isActive': isActive,
    };
  }

  Map<String, dynamic> loginToJson() {
    return {'email': email, 'password': password, 'userType': "factory"};
  }

  // Método para criar uma instância a partir de um mapa JSON
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      businessName: json['businessName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      cnpj: json['cnpj'] as String,
      isActive: json["isActive"] as bool,
    );
  }
}
