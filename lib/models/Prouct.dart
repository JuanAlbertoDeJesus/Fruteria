class Product {
  final String nombre;
  final double precio;

  final String image;
  final int minGrams;

  Product(
      {required this.image,
      required this.minGrams,
      required this.nombre,
      required this.precio});

  Product copyWith({
    String? nombre,
    double? precio,
    String? image,
    int? minGrams,
  }) =>
      Product(
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
        image: image ?? this.image,
        minGrams: minGrams ?? this.minGrams,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        nombre: json['nombre'],
        precio: json['precio'],
        image: json['image'],
        minGrams: json['minGrams'],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "precio": precio,
      };

  // TODO: implement props
  List<Object?> get props => [nombre, precio, image, minGrams];
}
