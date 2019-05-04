import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/home_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barkery',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.teal.withOpacity(0.8),
      ),
      home: Adoption(),
    );
  }
}

class Adoption extends StatefulWidget {
  
 @override
 State<StatefulWidget> createState() {
    return _AdoptionPage();
  }
}


class _AdoptionPage extends State<Adoption> {
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.teal.withOpacity(0.8),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
             title: new Text("Barkery"),
             actions: [
          new IconButton(
            icon: new Image.asset('assets/petlogo2.png'),
            tooltip: 'HomePage',
            onPressed: () => {
              Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()),
                  ),


            },
          ),
           
        ],
            bottom: TabBar(
              tabs: [
                Tab(icon: new Image.asset('assets/caticon1.png')),
                Tab(icon: new Image.asset('assets/dogicon.png')),
                Tab(icon: new Image.asset('assets/sheltericon.png')),
                Tab(icon: Icon(Icons.arrow_forward)),

              ],
            ),
            
          ),
          body: TabBarView(
            children: [
              CatPage(),
              DogPage(),
              OthersPage(),
              ShelterPage()
            ],
          ),
        ),
      ),
    );
  }
}





class CatPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new CatPageState();

}

class CatPageState extends State<CatPage> {

   final formKey = GlobalKey<FormState>();

  String _fullname;
  String _petBreed;
  String _address;
  String _pinCode;
  String _petDescription;

  void validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      print('Form is valid. Fullname: $_fullname,breed: $_petBreed,address:$_address,pincode: $_pinCode,petdescription:$_petDescription,');
    }
    else{
      print('Form is invalid.  Fullname: $_fullname,breed: $_petBreed,address:$_address,pincode: $_pinCode,petdescription:$_petDescription,');

    }

  }


  @override
  Widget build(BuildContext context) {
    return new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/cat1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
              new Form(key: formKey, child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(40.0,5.0,40.0,0),
                  child: new ListView(
                    children: <Widget>[
                      new TextFormField(
                        validator: (value) => value.isEmpty ? 'Name can\'t be empty ' : null,
                        onSaved: (value) => _fullname = value,
                        maxLength: 20,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your fullname",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                         validator: (value) => value.isEmpty ? 'Address can\'t be empty ' : null,
                        onSaved: (value) => _address = value,
                        maxLength: 20,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your address",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Pincode can\'t be empty ' : null,
                        onSaved: (value) => _pinCode = value,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter the pincode",
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:17.0),
                      ),

                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Breed can\'t be empty ' : null,
                        onSaved: (value) => _petBreed = value,
                         maxLength: 20,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),

                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your pet's breed",
                          
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Pet description can\'t be empty ' : null,
                        onSaved: (value) => _petDescription = value,
                         maxLength: 25,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(

                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Pet description",
                        ),
                        keyboardType: TextInputType.text,
                      ),


                       new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),


                    
                      Container(
                         width: 280.0,
                         height: 45.0,
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
              // Where the linear gradient begins and ends
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [
                // Colors are easy thanks to Flutter's Colors class.
                          Color(0xff1d83ab),
                          Colors.tealAccent,
              ],
            ),
          ),
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Righteous',
                fontWeight: FontWeight.w600,
              ),
            ),
            textColor: Colors.white,
            color: Colors.transparent,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: validateAndSave,
          ),
                      ),


               

                    ],
                  ),
                ),
              ),
               
              )

            ]
          );
  }
}

class DogPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new DogPageState();

}

class DogPageState extends State<DogPage> {

   final formKey = GlobalKey<FormState>();

  String _fullname;
  String _petBreed;
  String _address;
  String _pinCode;
  String _petDescription;

  void validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      print('Form is valid. Fullname: $_fullname,breed: $_petBreed,address:$_address,pincode: $_pinCode,petdescription:$_petDescription,');
    }
    else{
      print('Form is invalid.  Fullname: $_fullname,breed: $_petBreed,address:$_address,pincode: $_pinCode,petdescription:$_petDescription,');

    }

  }


  @override
  Widget build(BuildContext context) {
    return new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/dog1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
              new Form(key: formKey, child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(40.0,5.0,40.0,0),
                  child: new ListView(
                    children: <Widget>[
                      new TextFormField(
                        validator: (value) => value.isEmpty ? 'Name can\'t be empty ' : null,
                        onSaved: (value) => _fullname = value,
                        maxLength: 20,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your fullname",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                         validator: (value) => value.isEmpty ? 'Address can\'t be empty ' : null,
                        onSaved: (value) => _address = value,
                        maxLength: 20,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your address",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Pincode can\'t be empty ' : null,
                        onSaved: (value) => _pinCode = value,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter the pincode",
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:17.0),
                      ),

                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Breed can\'t be empty ' : null,
                        onSaved: (value) => _petBreed = value,
                         maxLength: 20,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your pet's breed",
                          
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                          validator: (value) => value.isEmpty ? 'Pet description can\'t be empty ' : null,
                        onSaved: (value) => _petDescription = value,
                         maxLength: 25,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(

                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Pet description",
                        ),
                        keyboardType: TextInputType.text,
                      ),


                       new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),


                    
                      Container(
                         width: 280.0,
                         height: 45.0,
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
              // Where the linear gradient begins and ends
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [
                // Colors are easy thanks to Flutter's Colors class.
                          Color(0xff1d83ab),
                          Colors.tealAccent,
              ],
            ),
          ),
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Righteous',
                fontWeight: FontWeight.w600,
              ),
            ),
            textColor: Colors.white,
            color: Colors.transparent,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: validateAndSave,
          ),
                      ),


               

                    ],
                  ),
                ),
              ),
               
              )

            ]
          );
  }
}

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/pet2.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
              new Form(child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(40.0,5.0,40.0,0),
                  child: new ListView(
                    children: <Widget>[
                      new TextFormField(
                        maxLength: 20,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your fullname",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        maxLength: 20,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your address",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter the pet type",
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),

                       new TextFormField(
                         maxLength: 20,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your pet's breed",
                          
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                         maxLength: 25,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(

                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Mention disease of the pet(If any)",
                        ),
                        keyboardType: TextInputType.text,
                      ),


                       new Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                      ),


                    
                      Container(
                         width: 280.0,
                         height: 45.0,
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
              // Where the linear gradient begins and ends
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [
                // Colors are easy thanks to Flutter's Colors class.
                          Color(0xff1d83ab),
                          Colors.tealAccent,
              ],
            ),
          ),
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Righteous',
                fontWeight: FontWeight.w600,
              ),
            ),
            textColor: Colors.white,
            color: Colors.transparent,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                               
                            },
          ),
                      ),


               

                    ],
                  ),
                ),
              ),
               
              )

            ]
          );
  }
}

class ShelterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/cat1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
              new Form(child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.fromLTRB(40.0,5.0,40.0,0),
                  child: new ListView(
                    children: <Widget>[
                      new TextFormField(
                        maxLength: 20,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your fullname",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        maxLength: 20,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your address",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter the pet type",
                          
                        ),
                        keyboardType: TextInputType.number,
                      ),

                       new TextFormField(
                         maxLength: 20,
                         style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Enter your pet's type",
                          
                        ),
                        keyboardType: TextInputType.text,
                      ),
                       new TextFormField(
                         maxLength: 25,
                        cursorColor: Colors.tealAccent,
                        style: TextStyle(
                          color: Colors.tealAccent,
                        ),
                        decoration: new InputDecoration(

                          labelStyle: TextStyle(color: Colors.tealAccent),
                          labelText: "Mention pet's breed",
                        ),
                        keyboardType: TextInputType.text,
                      ),


                       new Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                      ),


                    
                      Container(
                         width: 280.0,
                         height: 45.0,
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
              // Where the linear gradient begins and ends
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [
                // Colors are easy thanks to Flutter's Colors class.
                          Color(0xff1d83ab),
                          Colors.tealAccent,
              ],
            ),
          ),
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Righteous',
                fontWeight: FontWeight.w600,
              ),
            ),
            textColor: Colors.white,
            color: Colors.transparent,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                               
                            },
          ),
                      ),


               

                    ],
                  ),
                ),
              ),
               
              )

            ]
          );  }
}

