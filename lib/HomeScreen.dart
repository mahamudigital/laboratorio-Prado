import 'package:flutter/material.dart';
import 'package:prado_app/Bionucle1.dart';
import 'package:prado_app/Concentrado1.dart';
import 'package:prado_app/MinerPlus1.dart';
import 'package:prado_app/MinerPlus2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _escolha1;

  void _miner() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MinerPlus1()));
  }

  void _Bio() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bionucle1()));
  }

  void _Conce() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Concentrado1()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "imagens/prado_nutricao_branca.png",
          height: 80,
          width: 80,
        ),
        backgroundColor: Color.fromRGBO(0, 67, 99,1),
      ),
      backgroundColor: Color.fromRGBO(0, 67, 99,1),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10,40,10,20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(10,10,10,10)),
                Text('Escolha o produto ideal para sua propriedade:',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(30)),
                    GestureDetector(
                      onTap: _miner,
                      child: Text(
                        "º Miner Plus IATF "
                            " Suplemento mineral aditivado com o"
                            " Concentrado IATF Prado, pronto para ser"
                            " levado ao cocho.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    GestureDetector(
                      onTap: _Bio,
                      child: Text(
                        "º Bionúcleo IATF"
                            "  Para propriedades que fazem uso de suplementos"
                            "  de alto consumo, ou que misturam o suplemento"
                            " mineral proteico energético na fazenda.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    GestureDetector(
                      onTap: _Conce,
                      child: Text(
                        "º Concentrado IATF"
                            "  Aditivo para mistura na dieta tradicional de sua"
                            "  fazenda durante o período do protocolo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Image.asset(
                      "imagens/prado_logo_branca.png",
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ],

            )
        ),
      )
    );
  }
}