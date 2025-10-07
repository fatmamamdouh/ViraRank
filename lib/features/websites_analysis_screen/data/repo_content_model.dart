class RepoContentModel
{
  String name;
  String download_url;

  RepoContentModel(this.name, this.download_url);

  factory RepoContentModel.fromJson(Map<String, dynamic> json)
  {
    return RepoContentModel(
        json['name'],
        json['download_url']
    );
  }
}