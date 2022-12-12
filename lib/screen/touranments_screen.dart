import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:soccerflutter/components/loader_componenet.dart';
import 'package:soccerflutter/helpers/api_helper.dart';
import 'package:soccerflutter/model/response.dart';
import 'package:soccerflutter/model/touranment.dart';

class TouranmentScreen extends StatefulWidget {
 

  @override
  _touranmentScreen createState() => _touranmentScreen();
}

class _touranmentScreen extends State<TouranmentScreen> {
  List<Tournament> _touranments=[];
  bool _showLoader = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTouranments();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("touranments"),

      ),
      body: Center(child:_showLoader ? LoaderComponent(text: "Loading ....",) :_getContent(),),
    );
  }
  
Widget  _getContent() {
  return _touranments.length==0?
  _nocontent():_getListView();
}
 Widget _nocontent() {
  return Center(
    child:Container(
     margin: EdgeInsets.all(20),
     child: Text("there is no touranments" , style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
    
      ),
  );
 }
 Widget _getListView() {
  return RefreshIndicator(
     onRefresh: _getTouranments,
     child: ListView(
      children:_touranments.map((e) {
        return Card(
          child: InkWell(
            onTap: () =>{},
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                       imageUrl: e.logoFullPath,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.contain,
                        height: 100,
                        width: 150,
                        placeholder: (context, url) => Image(
                          image: AssetImage('assets/noimage.jpeg'),
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                         ), 
                        ),
                      ), 
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(e.name ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                        ),
                        Icon(Icons.arrow_forward_ios)                    
                     ],

              ),
            ),
          ),
        );
      }).toList(),
     ),
    );
 }
  

  Future<Null>_getTouranments() async{
   
  var connectivityResult= await Connectivity().checkConnectivity();  
  if(connectivityResult == ConnectivityResult.none )
  {
   
    await showAlertDialog(
      context: context, 
      title:'Error',  
      message: 'check your internet connection.',    
     actions: <AlertDialogAction>[
      AlertDialogAction(key: null, label:'Accept')
     ]
         );
      return ;
      
  }
    Response response = await Apihelper.getTouranment();

    
    if (!response.isSuccess) {
      await showAlertDialog(
        context: context,
        title: 'Error', 
        message: response.message,
        actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Accept'),
        ]
      );    
      return;
    }

    setState(() {
      _touranments = response.result;
    });    
  }

}