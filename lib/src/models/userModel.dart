class UserModel {
  String displayName; // Nombre del usuario
  String? imageUrl; // URL de la foto de perfil del usuario

  UserModel({
    required this.displayName,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String name = json['display_name'];
    String? imageUrl;

    // Verificar si hay una imagen de perfil disponible
    if (json['images'] != null && json['images'].isNotEmpty) {
      imageUrl = json['images'][0]['url'];
    }

    return UserModel(
      displayName: name,
      imageUrl: imageUrl,
    );
  }
}
