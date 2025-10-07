class ProfileModel
{
  final int id;
  final String userName;
  final String email;
  final String birthDate;
  final bool gender;
  final String? imageUrl;

  ProfileModel(
      this.id,
      this.userName,
      this.email,
      this.birthDate,
      this.gender,
      {
    this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json)
  {
    return ProfileModel(
        json['id'],
        json['userName'],
        json['email'],
        json['birthDate'],
        json['gender'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}