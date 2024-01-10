class User {
  final String nombreyApellido;
  final String correo;
  final String telefono;
  final String idUser;

  User(
      {required this.nombreyApellido,
      required this.correo,
      required this.telefono,
      required this.idUser});

  User copyWith({
    String? nombreyApellido,
    String? correo,
    String? telefono,
    String? idUser,
  }) =>
      User(
        nombreyApellido: nombreyApellido ?? this.nombreyApellido,
        correo: correo ?? this.correo,
        telefono: telefono ?? this.telefono,
        idUser: idUser ?? this.idUser,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        nombreyApellido: json['nombreyApellido'],
        correo: json['correo'],
        telefono: json['telefono'],
        idUser: json['idUser'],
      );

  Map<String, dynamic> toJson() => {
        "nombreyApellido": nombreyApellido,
        "correo": correo,
        "telefono": telefono,
        "idUser": idUser,
      };

  // TODO: implement props
  List<Object?> get props => [nombreyApellido, correo, telefono, idUser];
}
