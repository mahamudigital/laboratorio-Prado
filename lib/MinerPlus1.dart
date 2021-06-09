import 'package:flutter/material.dart';
import 'dart:math';
import 'package:input_calculator/input_calculator.dart';
import 'package:prado_app/MinerPlus2.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:url_launcher/url_launcher.dart';

class MinerPlus1 extends StatefulWidget {
  @override
  _MinerPlus1State createState() => _MinerPlus1State();
}

class _MinerPlus1State extends State<MinerPlus1> {


  TextEditingController _precoBezerro =TextEditingController();
  TextEditingController _plantel = TextEditingController();
  TextEditingController _suplementoMineral = TextEditingController();
  TextEditingController _minerPlus = TextEditingController();
  TextEditingController _textoResultado = TextEditingController();
//double indice1= 48.98;


void _calculate() {
  if (_precoBezerro.text.trim().isNotEmpty &&
      _plantel.text.trim().isNotEmpty) {
    final firstValue = double.parse(_precoBezerro.text.replaceAll(",","."));
    final secondValue = double.parse(_plantel.text.replaceAll(",","."));
    final thidvalue = double.parse(_suplementoMineral.text.replaceAll(",","."));
    final forthvalue = double.parse(_minerPlus.text.replaceAll(",","."));
    var prazo = 90;
    //var plantel = 100;
    var ganhoValidado = 0.05;
   // var precoBezerro= 1973.72;
    var consumoVaca = 0.1;
    //var minerplus = 245;
   // var suplementoMineral =108.95;
    var apresentacao = 25;
    var resultadomarkup1 = (forthvalue / apresentacao);
    var resultadomarkup2 = (thidvalue / apresentacao);
    var custoDieta1 = (resultadomarkup1*consumoVaca*prazo);
    var custoDieta2= (resultadomarkup2*consumoVaca*prazo);
    var indice1 = -(custoDieta2-custoDieta1);
    var ganhoBezerro = (ganhoValidado*firstValue);
    var ganhoresultado = (ganhoBezerro*secondValue).toStringAsPrecision(2);//toDouble();
    var ganhoresultado2 = double.parse(ganhoresultado);
    var resultado = (indice1*secondValue).toStringAsFixed(2);
    var resultado1 = double.parse(resultado);
    var investbezerro = (resultado1/firstValue).toStringAsPrecision(2);
    var ganhoResultadoBezerro = (ganhoresultado2/firstValue);
    var resultado2 = (resultado1/secondValue/90).toStringAsPrecision(2);
    var resultadocenvacas=(indice1*100).toStringAsFixed(2);
    var ganhoInvest =(ganhoBezerro*100).toStringAsFixed(2);
    var ganhoInvest2 = double.parse(ganhoInvest);
    var resultadocenvacas2= double.parse(resultadocenvacas);
    var investimentobezerrocenvacas =(resultadocenvacas2/firstValue).toStringAsPrecision(2);
    var ganhoBezerrocenvacas = (ganhoInvest2/firstValue).toStringAsPrecision(2);
    var ganhoBezerroprodutor = (ganhoresultado2/firstValue).toStringAsPrecision(2);
    //var resultado = (indice1 * secondValue).toDouble();
    //var resultado2 = (resultado / secondValue/90).toString();
   print (ganhoresultado);
   print (ganhoresultado2);


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MinerPlus2
              (resultadocenvacas.toString(),resultado2.toString(),ganhoInvest.toString(),
                investimentobezerrocenvacas.toString(),ganhoBezerrocenvacas.toString(),_plantel.text,
                resultado.toString(),investbezerro.toString(),ganhoresultado2.toString(),ganhoBezerroprodutor.toString()))
    );


  }
}




    void _limparCampos() {
      _plantel.text = "";
      _precoBezerro.text = "";
      _suplementoMineral.text = "";
      _minerPlus.text = "";
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 67, 99,1),
      appBar: AppBar(
        title: Text("Miner Plus IATF"),
        backgroundColor: Color.fromRGBO(0, 67, 99,1),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10,40,10,20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Insira os dados:",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,

                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              GestureDetector(
                  child: Text("Preço do Bezerro", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                  onTap: () {launch("https://www.cepea.esalq.usp.br/br/indicador/bezerro-media-sao-paulo.aspx");
                    // do what you need to do when "Click here" gets clicked
                  }
              ),

              Padding(
                padding: EdgeInsets.fromLTRB( 10, 20, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: TextField(controller: _precoBezerro,
                        onChanged: (value){

                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Informe o Valor"
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),Text(
                        "por cabeça",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Text(
                  "Plantel",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB( 10, 20, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: TextField(controller: _plantel,
                        onChanged: (value){

                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Informe o Valor"
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),Text(
                        "vacas",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Text(
                  "Suplemento Mineral Reprodução",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB( 10, 20, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: TextField(controller: _suplementoMineral,
                        onChanged: (value){

                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Informe o Valor"
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),Text(
                        "saco de 25kg",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Text(
                  "Miner Plus IATF",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB( 10, 20, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: TextField(controller: _minerPlus,
                        onChanged: (value){
                        },
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                            labelText: "Informe o Valor"
                        ),
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18,
                        ),
                      ),
                    ),Text(
                        "saco de 25kg",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: RaisedButton (
                 color: Color.fromRGBO(0, 67, 99,1),
                 textColor: Colors.white,
                 padding: EdgeInsets.all(15),
                  child: Text(
                  "Calcular",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                onPressed: _calculate
              ),
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
          ),

        ),
      )
    );
  }
}