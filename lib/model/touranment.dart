import 'package:soccerflutter/model/Groups.dart';

class Tournament {
  int id=0;
  String name='';
  String startDate='';
  String startDateLocal='';
  String endDate='';
  String endDateLocal='';
  bool isActive=true;
  String logoPath="";
  String logoFullPath="";
  List<Groups> groups=[];

  Tournament(
      {required this.id,
       required this.name,
       required this.startDate,
        required this.startDateLocal,
        required this.endDate,
        required this.endDateLocal,
       required this.isActive,
       required this.logoPath,
       required this.logoFullPath,
       required this.groups});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    startDateLocal = json['startDateLocal'];
    endDate = json['endDate'];
    endDateLocal = json['endDateLocal'];
    isActive = json['isActive'];
    logoPath = json['logoPath'];
    logoFullPath = json['logoFullPath'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['startDateLocal'] = this.startDateLocal;
    data['endDate'] = this.endDate;
    data['endDateLocal'] = this.endDateLocal;
    data['isActive'] = this.isActive;
    data['logoPath'] = this.logoPath;
    data['logoFullPath'] = this.logoFullPath;
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}