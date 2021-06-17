import './car_widget.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import './data.dart';
import './BookCar.dart';

class Home extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeState createState() => _HomeState();
}
//Our Home state, the logic and internal state for a StatefulWidget.
class _HomeState extends State<Home> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _nebulae;
  List<String> _filterList;

  @override
  void initState() {
    super.initState();
    _nebulae = new List<String>();
    _nebulae = [
      "Aceh",
      "Ambon",
      "Bali",
      "Batam",
      "Bandung",
      "Balikpapan",
      "Banyuwangi",
      "Bengkulu",
      "Bukit tinggi",
      "Jakarta",
      "Yogyakarta",
      "Palembang",
      "Tanjung pinang",
      "Jambi"
    ];
    _nebulae.sort();
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Pilih Kotamu"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _populerlist() : _createListView(),   _performSearch()
          ],
        ),
      ),
    );
  }
  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.black54),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
  Widget _populerlist()  {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Popular"),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                  image: AssetImage('assets/batam.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : [
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),

              ]
          ),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : [
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),
                Image.asset(
                  "assets/batam.jpg",
                  width: 90.0,
                  height: 70.0,
                  fit: BoxFit.cover,),

              ]
          )
        ]
    );

  }
  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _nebulae.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white60,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_nebulae[index]}"),
              ),
            );
          }),
    );
  }

  //Perform actual search
  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }
  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white60,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_filterList[index]}"),
              ),
            );
          }),
    );
  }
}