class PostsModel {
  bool viral;
  double probability;


  PostsModel(this.viral, this.probability);

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      json['viral'] ?? false,
      (json['probability'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
