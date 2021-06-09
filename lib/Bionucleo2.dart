import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bionucleo2 extends StatefulWidget {


  Bionucleo2(this.resultadocenvacas,this.resultado2,this.ganhoInvest,
      this.investimentobezerrocenvacas,this.ganhoBezerrocenvacas,this._plantel,
      this.resultado,this.investbezerro,this.ganhoresultado,this.ganhoBezerroprodutor);

  var resultadocenvacas;
  var ganhoInvest;
  var investimentobezerrocenvacas;
  String resultado;
  String resultado2;
  var _plantel;
  double cenvacas= 100;
  var ganhoBezerrocenvacas;
  var investbezerro;
  var ganhoresultado;
  var ganhoBezerroprodutor;

  @override
  _Bionucleo2State createState() => _Bionucleo2State();

}

class _Bionucleo2State extends State<Bionucleo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bionúcleo IATF"),
        backgroundColor: Color.fromRGBO(0, 67, 99,1),
      ),
      backgroundColor: Color.fromRGBO(0, 67, 99,1),
      body: Container(
        color: Color.fromRGBO(0, 67, 99,1),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Confira seus ganhos:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 15, 10, 10),
                child:Text("Por plantel de 100 vacas",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child:
                      Text(
                        "Investimento R\$ ${widget.resultadocenvacas}        Bezerros ${widget.investimentobezerrocenvacas}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),

              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child:
                      Text("Investimento cabeça/dia R\$ ${widget.resultado2}",
                          style: TextStyle(
                            color: Colors.white,
                          )
                      ),
                    ),
                  ],
                ),

              ),

              Text("Ganho Líquido  R\$  ${widget.ganhoInvest}     Bezerros ${widget.ganhoBezerrocenvacas}",
                  style: TextStyle(
                    color: Colors.white,
                  )
              ),

              Padding(
                padding:EdgeInsets.fromLTRB(0, 30, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child:
                      Text("No seu Plantel de: ${widget._plantel}  vacas",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ],
                ),

              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child:
                      Text("Investimento R\$: ${widget.resultado}       Bezerros ${widget.investbezerro}",
                          style: TextStyle(
                            color: Colors.white,
                          )
                      ),
                    ),
                  ],
                ),

              ),
              Text("Investimento cabeça/dia R\$ ${widget.resultado2}",
                  style: TextStyle(
                    color: Colors.white,
                  )
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 20, 10, 10),
                child:
                Text("Ganho   R\$  ${widget.ganhoresultado}                    Bezerros ${widget.ganhoBezerroprodutor}",
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(20)),
                  Text("LABORÁTORIO PRADO",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      )
                  ),
                  Text( "08006462026",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      )
                  ),
                  GestureDetector(
                      child: Text("www.laboratorioprado.com.br", style: TextStyle(decoration: TextDecoration.underline,fontSize: 10, color: Colors.blue)),
                      onTap: () {launch("https://www.laboratorioprado.com.br");
                        // do what you need to do when "Click here" gets clicked
                      }
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
          ),


        ),
      ),


    );
  }
}
