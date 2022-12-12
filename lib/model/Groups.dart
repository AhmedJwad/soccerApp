import 'package:soccerflutter/model/GroupDetails.dart';
import 'package:soccerflutter/model/Matches.dart';

class Groups {
  int id=0;
  String name='';
  List<GroupDetails> groupDetails=[];
  List<Matches> matches=[];

  Groups({required this.id, required this.name,required this.groupDetails,required this.matches});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['groupDetails'] != null) {
      groupDetails = <GroupDetails>[];
      json['groupDetails'].forEach((v) {
        groupDetails.add(new GroupDetails.fromJson(v));
      });
    }
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.groupDetails != null) {
      data['groupDetails'] = this.groupDetails.map((v) => v.toJson()).toList();
    }
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}