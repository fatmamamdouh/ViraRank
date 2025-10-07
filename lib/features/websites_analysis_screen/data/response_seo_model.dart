class ResponseOfSEOModel {
  bool seo_friendly;
  double probability;
  String top_class;

  ResponseOfSEOModel(this.seo_friendly, this.probability, this.top_class);

  factory ResponseOfSEOModel.fromJson(Map<String, dynamic> json) {
    return ResponseOfSEOModel(
      json['seo_friendly'] ?? false,
      (json['probability'] as num?)?.toDouble() ?? 0.0,
      json['top_class'] ?? '',
    );
  }
}
