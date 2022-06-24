import 'package:econodata/models/CriptoModels.dart';
import 'package:econodata/providers/criptoProvider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'detailCriptoBsn.dart';
import 'detailCriptoPage.dart';

class ValoresPage extends StatefulWidget {
  ValoresPage({Key? key}) : super(key: key);

  @override
  State<ValoresPage> createState() => _ValoresPageState();
}

class _ValoresPageState extends State<ValoresPage> {
  String busqueda = '';
  String simbol = '';
  TextEditingController _controllerBusqueda = TextEditingController();
  TextEditingController _controllerSimbol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cripto Valores'),
      ),
      body: SafeArea(child: 
        ListView(children: [
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.54,
                  child: TextFormField(
                    controller: _controllerBusqueda,
                    decoration: InputDecoration(
                      labelText: 'Buscar Cripto',
                      suffixIcon: IconButton(
                        icon: Icon(MdiIcons.magnify),
                        onPressed: (){
                          setState(() {
                            busqueda = _controllerBusqueda.text!=''?_controllerBusqueda.text:'';
                          });
                        },),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: TextFormField(
                    controller: _controllerSimbol,
                    decoration: InputDecoration(
                      labelText: 'Abreviatura',
                      suffixIcon: IconButton(
                        icon: Icon(MdiIcons.magnify),
                        onPressed: (){
                          setState(() {
                            simbol = _controllerSimbol.text!=''?_controllerSimbol.text:'';
                          });
                        },),
                    ),
                    onChanged: (value) => simbol = value,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: FutureBuilder(
              future: CriptoProvider.getCoinListLocal(busqueda,simbol),
              builder: (context,AsyncSnapshot<List<CriptoList>> snapshot) {
                if(snapshot.hasData){
                  List<CriptoList> criptos = snapshot.data!;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: criptos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: Ink(
                            child: ListTile(
                              onLongPress: (){},
                              onTap: () async {
                                DetailCriptoBsn.title = criptos[index].name;
                                DetailCriptoBsn.symbol = criptos[index].symbol;
                                await DetailCriptoBsn.trabajarData(criptos[index].id);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailCriptoPage(),
                                  ),
                                );
                              },
                              title: Text(criptos[index].name),
                              subtitle: Text(criptos[index].symbol),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }else{
                  return Container();
                }
              },
            ),
          ),
        ],)
      ),
    );
  }
}

class object {
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [
    'Bitcoin',
    'Ethereum',
    'XRP',
    'Bitcoin Cash',
    'Shiba Inu',
    'Cardano',
    'Tether',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if(query.isEmpty){
            close(context, null);
          }else{
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(String term in searchTerms){
      if(term.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: (){
            query = matchQuery[index];
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(String term in searchTerms){
      if(term.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: (){
            query = matchQuery[index];
          },
        );
      },
    );
  }
 
}