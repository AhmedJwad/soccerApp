
import 'package:soccerflutter/model/Team.dart';
import 'package:soccerflutter/model/predictions.dart';

class Matches {
  int id=0;
  String date="";
  String dateLocal="";
  Team local=Team(id: 0, name: "", logoPath:"", logoFullPath: "");
  Team visitor=Team(id: 0, name: "", logoPath:"", logoFullPath: "");
  int? goalsLocal;
  int? goalsVisitor;
  bool isClosed=true;
  List<predictions> prediction=[]; 

  Matches(
      {required this.id,
     required this.date,
    required  this.dateLocal,
     required this.local,
     required this.visitor,
     this.goalsLocal,
    this.goalsVisitor,
    required  this.isClosed,
    required this.prediction,
    });

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateLocal = json['dateLocal'];
    local = Team.fromJson(json['local']) ;
    visitor =
         Team.fromJson(json['visitor']) ;
    goalsLocal = json['goalsLocal'];
    goalsVisitor = json['goalsVisitor'];
    isClosed = json['isClosed'];
     if (json['prediction'] != null) {
      prediction = [];
      json['prediction'].forEach((v) {
        prediction.add(new predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['dateLocal'] = this.dateLocal;    
    data['local'] = this.local.toJson(); 
    data['visitor'] = this.visitor.toJson();   
    data['goalsLocal'] = this.goalsLocal;
    data['goalsVisitor'] = this.goalsVisitor;
    data['isClosed'] = this.isClosed;
    data['prediction'] = this.prediction.map((v) => v.toJson()).toList();  
    return data;
  }
}