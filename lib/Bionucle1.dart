import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

import 'package:prado_app/Bionucleo2.dart';

class Bionucle1 extends StatefulWidget {
  @override
  _Bionucle1State createState() => _Bionucle1State();

}

class _Bionucle1State extends State<Bionucle1> {

  TextEditingController _precoBezerro =TextEditingController();
  TextEditingController _plantel = TextEditingController();
  TextEditingController _suplementoMineral = TextEditingController();
  TextEditingController _minerPlusProteinado = TextEditingController();
  TextEditingController _bioNucleo = TextEditingController();
  TextEditingController _milho = TextEditingController();
//double indice1= 48.98;

  void _calculate() {
    if (_precoBezerro.text.trim().isNotEmpty &&
        _plantel.text.trim().isNotEmpty) {
      final firstValue = double.parse(_precoBezerro.text.replaceAll(",","."));
      final secondValue = double.parse(_plantel.text.replaceAll(",","."));
      final thidvalue = double.parse(_suplementoMineral.text.replaceAll(",","."));
      final forthvalue = double.parse(_minerPlusProteinado.text.replaceAll(",","."));
      final fivevalue = double.parse(_bioNucleo.text.replaceAll(",","."));
      final sixvalue = double.parse(_milho.text.replaceAll(",","."));
      var prazo = 90;
      //var plantel = 100;
      var ganhoValidado = 0.05;
      // var precoBezerro= 1973.72;
      var consumoVaca = 0.1;
      //var minerplus = 245;
      // var suplementoMineral =108.95;
      var apresentacao = 25;
      var apresentacaoMilho = 60;
      var resultadomarkupminerplus1 = (forthvalue / apresentacao);//3,01
      var resultadomarkupminerplus2 = (thidvalue / apresentacao);
      var resultadomarkupbio1 = (fivevalue/apresentacao);
      var resultadomarkupbio2 = (sixvalue/apresentacaoMilho);
      var custoDieta1 = (resultadomarkupminerplus1*consumoVaca*prazo);//66,27   parametro 50 vacas
      var custoDieta2= (resultadomarkupminerplus2*consumoVaca*prazo);//115,23
      var custoDietaBio1 = (resultadomarkupbio1*consumoVaca*prazo);//108,00
      var custoDietaBio2 = (resultadomarkupbio2*consumoVaca*prazo);//7,23
      var indiceTotalProgramaDietaControl = -(custoDieta2+custoDieta1);//115,23
      var indiceTotalProgramaDietaBionu = -(custoDietaBio1+custoDietaBio2);//66,27
      var indice1 =(indiceTotalProgramaDietaControl-indiceTotalProgramaDietaBionu);//-48,96
      var ganhoBezerro = (ganhoValidado*firstValue);
      var ganhoresultado = (ganhoBezerro*secondValue).toDouble();
      //var ganhoresultado2 = double.parse(ganhoresultado);
      var resultado = (indice1*secondValue).toStringAsFixed(2);
      var resultado1 = double.parse(resultado);
      var investbezerro = (resultado1/firstValue).toStringAsPrecision(2);
      var ganhoResultadoBezerro = (ganhoresultado/firstValue);
      var resultado2 = (resultado1/secondValue/90).toStringAsPrecision(2);
      var resultadocenvacas=(indice1*100).toStringAsFixed(2);
      var ganhoInvest =(ganhoBezerro*100);
      var resultadocenvacas2= double.parse(resultadocenvacas);
      var investimentobezerrocenvacas =(resultadocenvacas2/firstValue).toStringAsPrecision(2);
      var ganhoBezerrocenvacas = (ganhoInvest/firstValue).toStringAsPrecision(2);
      var ganhoBezerroprodutor = (ganhoresultado/firstValue);
      //var resultado = (indice1 * secondValue).toDouble();
      //var resultado2 = (resultado / secondValue/90).toString();
     print (custoDieta1);
     print (custoDieta2);


      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Bionucleo2
                (resultadocenvacas.toString(),resultado2.toString(),ganhoInvest.toString(),
                  investimentobezerrocenvacas.toString(),ganhoBezerrocenvacas.toString(),_plantel.text,
                  resultado.toString(),investbezerro.toString(),ganhoresultado.toString(),ganhoBezerroprodutor.toString()))
      );



    }
  }




  void _limparCampos() {
    _plantel.text = "";
    _precoBezerro.text = "";
    _suplementoMineral.text = "";
    _bioNucleo.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 67, 99,1),
        appBar: AppBar(
          title: Text("Bionúcleo IATF"),
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
                  "Suplemento Mineral Proteinado",
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
                        child: TextField(controller: _minerPlusProteinado,
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
                  "Bionúcleo IATF",
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
                        child: TextField(controller: _bioNucleo,
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
                GestureDetector(
                    child: Text("Milho", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                    onTap: () {launch("https://cepea.esalq.usp.br/br/indicador/milho.aspx");
                      // do what you need to do when "Click here" gets clicked
                    }
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB( 10, 20, 10, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: TextField(controller: _milho,
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
                        "saca de 60kg",
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