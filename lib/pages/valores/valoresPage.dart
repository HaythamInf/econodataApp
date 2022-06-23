import 'package:econodata/models/CriptoModels.dart';
import 'package:econodata/providers/criptoProvider.dart';
import 'package:flutter/material.dart';

class ValoresPage extends StatefulWidget {
  ValoresPage({Key? key}) : super(key: key);

  @override
  State<ValoresPage> createState() => _ValoresPageState();
}

class _ValoresPageState extends State<ValoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valores'),
      ),
      body: SafeArea(child: 
        ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            child: Center(child: Text('Cripto Monedas')),
          ),
          Container(
            child: FutureBuilder(
              future: CriptoProvider.getCoinListLocal(),
              builder: (context,AsyncSnapshot<List<CriptoList>> snapshot) {
                if(snapshot.hasData){
                  List<CriptoList> criptos = snapshot.data!;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: criptos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(criptos[index].name),
                            subtitle: Text(criptos[index].symbol),
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