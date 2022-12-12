import 'package:soccerflutter/model/Matches.dart';
import 'package:soccerflutter/model/Team.dart';
import 'package:soccerflutter/model/user.dart';

class predictions {
  int id=0;
  int GoalsLocal=0;
  int GoalsVisitor=0;
  int Points=0;
  User user=User(firstName: "", lastName: "", address: "", imageId: "",
   imageFullPath: "", userType: 0, loginType: 0, fullName: "", team:Team(id: 0, name: "", logoPath: "", logoFullPath: ""),
    id: "", userName: "", email:"", phoneNumber:"");
 
  predictions(
      {required this.id,
       required this.GoalsLocal,
       required this.GoalsVisitor,
       required this.Points,
       required this.user,
      

    });

  predictions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    GoalsLocal = json['GoalsLocal'];
    GoalsVisitor = json['GoalsVisitor'];
    Points = json['Points'];
    user = User.fromJson(json['user']) ;
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['GoalsLocal'] = this.GoalsLocal;
    data['GoalsVisitor'] = this.GoalsVisitor;    
    data['Points'] = this.Points; 
    data['user'] = this.user.toJson();   
   
    return data;
  }
}