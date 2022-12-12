class Team {
  int id=0;
  String name='';
  String logoPath='';
  String logoFullPath='';

  Team({required this.id,required this.name,required this.logoPath,required this.logoFullPath});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logoPath'];
    logoFullPath = json['logoFullPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logoPath'] = this.logoPath;
    data['logoFullPath'] = this.logoFullPath;
    return data;
  }
}
