import 'package:flutter/material.dart';
import 'package:prado_app/Concentrado2.dart';
import 'package:url_launcher/url_launcher.dart';

class Concentrado1 extends StatefulWidget {
  @override
  _Concentrado1State createState() => _Concentrado1State();
}

class _Concentrado1State extends State<Concentrado1> {
  TextEditingController _precoBezerro =TextEditingController();
  TextEditingController _plantel = TextEditingController();
  TextEditingController _suplementoMineral = TextEditingController();
  TextEditingController _suplementocorte = TextEditingController();
  TextEditingController _concentrado = TextEditingController();

//double indice1= 48.98;

  void _calculate() {
    if (_precoBezerro.text.trim().isNotEmpty &&
        _plantel.text.trim().isNotEmpty) {
      final firstValue = double.parse(_precoBezerro.text.replaceAll(",","."));
      final secondValue = double.parse(_plantel.text.replaceAll(",","."));
      final thirdvalue = double.parse(_suplementoMineral.text.replaceAll(",","."));
      final forthvalue = double.parse(_suplementocorte.text.replaceAll(",","."));
      final fivevalue = double.parse(_concentrado.text.replaceAll(",","."));

      var prazo = 90;
      //var plantel = 100;
      var ganhoValidado = 0.05;
      // var precoBezerro= 1973.72;
      var consumoVaca = 0.1;
      var consumoVacaConc= 0.00384615;
      var ConsumoVacaMiner= 0.09615385;
      //var minerplus = 245;
      // var suplementoMineral =108.95;
      var apresentacao = 25;
      var apresentacao2 = 1;
      var resultadomarkupMinerplusRepro = (thirdvalue / apresentacao);//4,36
      var resultadomarkupConcentrado1 = (fivevalue/apresentacao2);//175,00
      var resultadomarkupMinerplus = (forthvalue/apresentacao);//3,29

      var custoDietaMinerPlusReprod = (resultadomarkupMinerplusRepro*consumoVaca*prazo);//39,22   parametro 50 vacas
      var custoDietaConcentrado = (resultadomarkupConcentrado1*consumoVacaConc*prazo);//60,58
      var custoDietaMinerplus = (resultadomarkupMinerplus*ConsumoVacaMiner*prazo);//28,47

      var indiceTotalProgramaDietaConcentrado = (custoDietaConcentrado+custoDietaMinerplus);//89,04
      var indice1 =(custoDietaMinerPlusReprod-indiceTotalProgramaDietaConcentrado);//49,82
      var ganhoBezerro = (ganhoValidado*firstValue);
      var ganhoresultado = (ganhoBezerro*secondValue).toDouble();
      //var ganhoresultado2 = double.parse(ganhoresultado);
      var resultado = (-indice1*secondValue).toStringAsFixed(2);//-49,82
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
     print (indice1);
     print (custoDietaMinerPlusReprod);
     print (indiceTotalProgramaDietaConcentrado);


      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Concentrado2
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
    _concentrado.text = "";
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 67, 99,1),
        appBar: AppBar(
          title: Text("Concentrado IATF"),
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
                  "Suplemento Mineral Corte",
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
                        child: TextField(controller: _suplementocorte,
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
                  "Concentrado IATF",
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
                        child: TextField(controller: _concentrado,
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
                        "saco de 1kg",
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
