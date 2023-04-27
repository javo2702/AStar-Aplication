import 'dart:async';
import 'dart:collection';

import 'package:aplication_astar/astar/AlgoritmoAStar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';

final _GeneralGraph = AdjacencyList<MarcadorPuntos>();
final astar = AStar(_GeneralGraph);
late Vertex<MarcadorPuntos> _start;
late Vertex<MarcadorPuntos> _goal;
late Iterable<Vertex<MarcadorPuntos>> nodos;

void main() {
  llenarGrafo();
  runApp(MyApp());
}

void llenarGrafo(){
  MarcadorPuntos n0 = MarcadorPuntos(-12.051854786356744, -77.08760285340607,"Puerta 8",null);
  MarcadorPuntos n1 = MarcadorPuntos(-12.052902901992383, -77.08537006216996,"Cancha Fisi",null);
  MarcadorPuntos n2 = MarcadorPuntos(-12.054049196341792, -77.08472384681608,"Puerta 7",null);
  MarcadorPuntos n3 = MarcadorPuntos(-12.054681969094158, -77.08415543223975,"Residencia Universitaria",null);
  MarcadorPuntos n4 = MarcadorPuntos(-12.055609184809365, -77.08258145835988,"Autoseguro",null);
  MarcadorPuntos n5 = MarcadorPuntos(-12.055618099050246, -77.08218568823006,"Clinica Universitaria",null);
  MarcadorPuntos n6 = MarcadorPuntos(-12.055861074996164, -77.08184429878631,"Cafeteria Mecanica de Fluidos",null);
  MarcadorPuntos n7 = MarcadorPuntos(-12.05717111062063, -77.0802657904717,"Puerta 3",null);
  MarcadorPuntos n8 = MarcadorPuntos(-12.058106530583737, -77.08058721421207,"Cafeteria Contabilidad",null);
  MarcadorPuntos n9 = MarcadorPuntos(-12.059537120248212, -77.0796574522001,"Puerta 2",null);
  MarcadorPuntos n10 = MarcadorPuntos(-12.060295605043313, -77.0815118316055,"Cafe Express",null);
  MarcadorPuntos n11 = MarcadorPuntos(-12.061286892013413, -77.08613331024658,"Puerta 1",null);
  MarcadorPuntos n12 = MarcadorPuntos(-12.06004631797756, -77.08413445350641,"Cancha Quimica",null);
  MarcadorPuntos n13 = MarcadorPuntos(-12.059563105962244, -77.08444120526256,"Gimnasio Universitario",null);
  MarcadorPuntos n14 = MarcadorPuntos(-12.059056513271702, -77.08423477817426,"Cancha Atletica",null);
  MarcadorPuntos n15 = MarcadorPuntos(-12.059365334991206, -77.08301086600936,"Comedor Universitario",null);
  MarcadorPuntos n16 = MarcadorPuntos(-12.059225239100796, -77.08086021687635,"Cajero Banco Nacion",null);

  MarcadorPuntos n17 = MarcadorPuntos(-12.058423966746018, -77.08125632722005,"Piscina Universitaria",null);
  MarcadorPuntos n18 = MarcadorPuntos(-12.057441641606651, -77.08185714203557,"Cafeteria Letras",null);
  MarcadorPuntos n19 = MarcadorPuntos(-12.056222946853085, -77.08198509284894,"Restaurante Papas Fritas",null);
  final nodo0 = _GeneralGraph.createVertex(n0);
  final nodo1 = _GeneralGraph.createVertex(n1);
  final nodo2 = _GeneralGraph.createVertex(n2);
  final nodo3 = _GeneralGraph.createVertex(n3);
  final nodo4 = _GeneralGraph.createVertex(n4);
  final nodo5 = _GeneralGraph.createVertex(n5);
  final nodo6 = _GeneralGraph.createVertex(n6);
  final nodo7 = _GeneralGraph.createVertex(n7);
  final nodo8 = _GeneralGraph.createVertex(n8);
  final nodo9 = _GeneralGraph.createVertex(n9);
  final nodo10 = _GeneralGraph.createVertex(n10);
  final nodo11 = _GeneralGraph.createVertex(n11);
  final nodo12 = _GeneralGraph.createVertex(n12);
  final nodo13 = _GeneralGraph.createVertex(n13);
  final nodo14 = _GeneralGraph.createVertex(n14);
  final nodo15 = _GeneralGraph.createVertex(n15);
  final nodo16 = _GeneralGraph.createVertex(n16);
  final nodo17 = _GeneralGraph.createVertex(n17);
  final nodo18= _GeneralGraph.createVertex(n18);


  MarcadorPuntos a1 = MarcadorPuntos(-12.057944524499637, -77.08006066859912,"Auxiliar",null);//cerca conta
  MarcadorPuntos a2 = MarcadorPuntos(-12.058650482855088, -77.079888238895,"Auxiliar",null);//cerca a1
  MarcadorPuntos a3 = MarcadorPuntos(-12.058902855102248, -77.08102915866499,"Auxiliar",null);//cerca pisi y a4
  MarcadorPuntos a4 = MarcadorPuntos(-12.059295348799447, -77.08090092447745,"Auxiliar",null);//cerca bn
  MarcadorPuntos a5 = MarcadorPuntos(-12.060520402263181, -77.08139438742583,"Auxiliar",null);//cerca p2
  MarcadorPuntos a6 = MarcadorPuntos(-12.060338523281448, -77.08143711678001,"Auxiliar",null);//cerca a5
  MarcadorPuntos a7 = MarcadorPuntos(-12.060909305157564, -77.08427467823991,"Auxiliar",null);//cerca a6
  MarcadorPuntos a8 = MarcadorPuntos(-12.060775211207353, -77.08590216957441,"Auxiliar",null);//cerca a7 y p1
  MarcadorPuntos a9 = MarcadorPuntos(-12.060157250262986, -77.08441884116021,"Auxiliar",null);//cerca a8
  MarcadorPuntos a10 = MarcadorPuntos(-12.059600425154803, -77.08455386671257,"Auxiliar",null);//cerca a9
  MarcadorPuntos a11 = MarcadorPuntos(-12.058911227137628, -77.08454716118784,"Auxiliar",null);//cerca a10 y a12
  MarcadorPuntos a12 = MarcadorPuntos(-12.058991142485981, -77.08403464419408,"Auxiliar",null);//cerca a11 a13
  MarcadorPuntos a13 = MarcadorPuntos(-12.059263147654669, -77.0836448881301,"Auxiliar",null);//cerca a12
  MarcadorPuntos a14 = MarcadorPuntos(-12.05964544865236, -77.08332805309688,"Auxiliar",null);//cerca a12
  MarcadorPuntos a15 = MarcadorPuntos(-12.059428009512278, -77.08297398442275,"Auxiliar",null);//cerca a12
  MarcadorPuntos a16 = MarcadorPuntos(-12.059433336629308, -77.08270063509718,"Auxiliar",null);//cerca a12
  MarcadorPuntos a17 = MarcadorPuntos(-12.059094305947879, -77.08261267844293,"Auxiliar",null);//cerca a12
  MarcadorPuntos a18 = MarcadorPuntos(-12.059110900541674, -77.08312132509425,"Auxiliar",null);//cerca a12
  MarcadorPuntos a19 = MarcadorPuntos(-12.059109493716692, -77.08200113106618,"Auxiliar",null);//cerca a12

  MarcadorPuntos a20 = MarcadorPuntos(-12.05753936916972, -77.08202970372871,"Auxiliar",null);//cerca a12
  MarcadorPuntos a21 = MarcadorPuntos(-12.056438242779068, -77.08232315631327,"Auxiliar",null);//cerca a12
  MarcadorPuntos a22 = MarcadorPuntos(-12.056313468966975, -77.08244117527882,"Auxiliar",null);//cerca a12
  MarcadorPuntos a23 = MarcadorPuntos(-12.055686479673728, -77.08254962515022,"Auxiliar",null);//cerca a12
  MarcadorPuntos a24 = MarcadorPuntos(-12.05540728166591, -77.0823810199588,"Auxiliar",null);//cerca a12
  MarcadorPuntos a25 = MarcadorPuntos(-12.055579327630108, -77.08211262021948,"Auxiliar",null);//cerca a12
  MarcadorPuntos a26 = MarcadorPuntos(-12.055776387126826, -77.08178337870214,"Auxiliar",null);//cerca a12
  MarcadorPuntos a27 = MarcadorPuntos(-12.05616500725944, -77.0811811641446,"Auxiliar",null);//cerca a12
  MarcadorPuntos a28 = MarcadorPuntos(-12.056419111351309, -77.08080563575646,"Auxiliar",null);//cerca a12
  MarcadorPuntos a29 = MarcadorPuntos(-12.058363887599993, -77.08116192047144,"Auxiliar",null);//cerca a12
  MarcadorPuntos a30 = MarcadorPuntos(-12.057534454774316, -77.08175580555262,"Auxiliar",null);//cerca a12
  MarcadorPuntos a31 = MarcadorPuntos(-12.060022940918172, -77.07974160508388,"Auxiliar",null);//cerca a12
  MarcadorPuntos a32 = MarcadorPuntos(-12.060742260471496, -77.08272595198692,"Auxiliar",null);//cerca a12
  MarcadorPuntos a33 = MarcadorPuntos(-12.061087195044244, -77.08530056332755,"Auxiliar",null);//cerca a1
  MarcadorPuntos a34 = MarcadorPuntos(-12.055293918120059, -77.08249696168073,"Auxiliar",null);//cerca a1
  MarcadorPuntos a35 = MarcadorPuntos(-12.055492432766727, -77.08281949243053,"Auxiliar",null);//cerca a1
  MarcadorPuntos a36 = MarcadorPuntos(-12.055457141283231, -77.08326156257807,"Auxiliar",null);//cerca a1
  MarcadorPuntos a37 = MarcadorPuntos(-12.054733834637446, -77.08366932070192,"Auxiliar",null);//cerca a1
  MarcadorPuntos a38 = MarcadorPuntos(-12.054476774402959, -77.08411322629595,"Auxiliar",null);//cerca a1
  MarcadorPuntos a39 = MarcadorPuntos(-12.053778886914268, -77.08510909391386,"Auxiliar",null);//cerca a1
  MarcadorPuntos a40 = MarcadorPuntos(-12.05370381478735, -77.08581776624506,"Auxiliar",null);//cerca a1
  MarcadorPuntos a41 = MarcadorPuntos(-12.05363954950568, -77.08609135154069,"Auxiliar",null);//cerca a1
  MarcadorPuntos a42 = MarcadorPuntos(-12.05347560738965, -77.08644003872367,"Auxiliar",null);//cerca a1
  MarcadorPuntos a43 = MarcadorPuntos(-12.053336584395485, -77.08774627447775,"Auxiliar",null);//cerca a1



  final aux1 = _GeneralGraph.createVertex(a1);
  final aux2 = _GeneralGraph.createVertex(a2);
  final aux3 = _GeneralGraph.createVertex(a3);
  final aux4 = _GeneralGraph.createVertex(a4);
  final aux5 = _GeneralGraph.createVertex(a5);
  final aux6 = _GeneralGraph.createVertex(a6);
  final aux7 = _GeneralGraph.createVertex(a7);
  final aux8 = _GeneralGraph.createVertex(a8);
  final aux9 = _GeneralGraph.createVertex(a9);
  final aux10 = _GeneralGraph.createVertex(a10);
  final aux11 = _GeneralGraph.createVertex(a11);
  final aux12 = _GeneralGraph.createVertex(a12);
  final aux13 = _GeneralGraph.createVertex(a13);
  final aux14 = _GeneralGraph.createVertex(a14);
  final aux15 = _GeneralGraph.createVertex(a15);
  final aux16 = _GeneralGraph.createVertex(a16);
  final aux17 = _GeneralGraph.createVertex(a17);
  final aux18 = _GeneralGraph.createVertex(a18);
  final aux19 = _GeneralGraph.createVertex(a19);
  final aux20 = _GeneralGraph.createVertex(a20);
  final aux21 = _GeneralGraph.createVertex(a21);
  final aux22 = _GeneralGraph.createVertex(a22);
  final aux23 = _GeneralGraph.createVertex(a23);
  final aux24 = _GeneralGraph.createVertex(a24);
  final aux25 = _GeneralGraph.createVertex(a25);
  final aux26 = _GeneralGraph.createVertex(a26);
  final aux27 = _GeneralGraph.createVertex(a27);
  final aux28 = _GeneralGraph.createVertex(a28);
  final aux29 = _GeneralGraph.createVertex(a29);
  final aux30 = _GeneralGraph.createVertex(a30);
  final aux31 = _GeneralGraph.createVertex(a31);
  final aux32 = _GeneralGraph.createVertex(a32);
  final aux33 = _GeneralGraph.createVertex(a33);
  final aux34 = _GeneralGraph.createVertex(a34);
  final aux35 = _GeneralGraph.createVertex(a35);
  final aux36 = _GeneralGraph.createVertex(a36);
  final aux37 = _GeneralGraph.createVertex(a37);
  final aux38 = _GeneralGraph.createVertex(a38);
  final aux39 = _GeneralGraph.createVertex(a39);
  final aux40 = _GeneralGraph.createVertex(a40);
  final aux41 = _GeneralGraph.createVertex(a41);
  final aux42 = _GeneralGraph.createVertex(a42);
  final aux43 = _GeneralGraph.createVertex(a43);
  final nodo19 = _GeneralGraph.createVertex(n19);

  //Ayuda de AnimatedDefaultTextStyle
  MarcadorPuntos n21 = MarcadorPuntos( -12.058317667485555, -77.08559965200826,"Huaca",null);
  MarcadorPuntos n22 = MarcadorPuntos(-12.056635920514168, -77.08602386091714,"AuditorioUniversitario",null);
  MarcadorPuntos n23 = MarcadorPuntos(-12.056178936473858, -77.08612274167591,"PlazaCentral",null);
  MarcadorPuntos n24 = MarcadorPuntos(-12.055804614495086, -77.08593454925762,"BibliotecaCentral",null);
  MarcadorPuntos n25 = MarcadorPuntos(-12.054604570573316, -77.08515004624535,"Odontologia",null);
  MarcadorPuntos n26 = MarcadorPuntos(-12.056228788279979, -77.08718920777628,"Civil",null);
  MarcadorPuntos n27 = MarcadorPuntos(-12.055351396813458, -77.08771717633913,"FIEE",null);
  final nodo21 = _GeneralGraph.createVertex(n21);
  final nodo22 = _GeneralGraph.createVertex(n22);
  final nodo23 = _GeneralGraph.createVertex(n23);
  final nodo24 = _GeneralGraph.createVertex(n24);
  final nodo25 = _GeneralGraph.createVertex(n25);
  final nodo26 = _GeneralGraph.createVertex(n26);
  final nodo27 = _GeneralGraph.createVertex(n27);
  MarcadorPuntos nAA = MarcadorPuntos(-12.058228,-77.085494,"Auxiliar",null);
  MarcadorPuntos nAB = MarcadorPuntos(-12.057485,-77.085629,"Auxiliar",null);
  MarcadorPuntos nAC = MarcadorPuntos(-12.056959,-77.085617,"Auxiliar",null);
  MarcadorPuntos nAD = MarcadorPuntos(-12.056382,-77.085132,"Auxiliar",null);
  MarcadorPuntos nAE = MarcadorPuntos(-12.055414,-77.084751,"Auxiliar",null);
  MarcadorPuntos nAF = MarcadorPuntos(-12.055076,-77.085208,"Auxiliar",null);
  MarcadorPuntos nAG = MarcadorPuntos(-12.054907,-77.085245,"Auxiliar",null);
  MarcadorPuntos nAH = MarcadorPuntos(-12.054651,-77.085093,"Auxiliar",null);
  MarcadorPuntos nAI = MarcadorPuntos(-12.054950,-77.085363,"Auxiliar",null);
  MarcadorPuntos nAJ = MarcadorPuntos(-12.054760,-77.086608,"Auxiliar",null);
  MarcadorPuntos nAK = MarcadorPuntos(-12.055237,-77.086738,"Auxiliar",null);
  MarcadorPuntos nAL = MarcadorPuntos(-12.055865,-77.086815,"Auxiliar",null);
  MarcadorPuntos nAM = MarcadorPuntos(-12.055905,-77.086662,"Auxiliar",null);
  MarcadorPuntos nAN = MarcadorPuntos(-12.056255,-77.086848,"Auxiliar",null);
  final nodoAA = _GeneralGraph.createVertex(nAA);
  final nodoAB = _GeneralGraph.createVertex(nAB);
  final nodoAC = _GeneralGraph.createVertex(nAC);
  final nodoAD = _GeneralGraph.createVertex(nAD);
  final nodoAE = _GeneralGraph.createVertex(nAE);
  final nodoAF = _GeneralGraph.createVertex(nAF);
  final nodoAG = _GeneralGraph.createVertex(nAG);
  final nodoAH = _GeneralGraph.createVertex(nAH);
  final nodoAI = _GeneralGraph.createVertex(nAI);
  final nodoAJ = _GeneralGraph.createVertex(nAJ);
  final nodoAK = _GeneralGraph.createVertex(nAK);
  final nodoAL = _GeneralGraph.createVertex(nAL);
  final nodoAM = _GeneralGraph.createVertex(nAM);
  final nodoAN = _GeneralGraph.createVertex(nAN);

  _GeneralGraph.addEdge(nodo21,nodoAA,weight:12.39);
  _GeneralGraph.addEdge(nodoAA,nodoAB,weight:79.98);
  _GeneralGraph.addEdge(nodoAB,nodoAC,weight:61.44);
  _GeneralGraph.addEdge(nodoAC,nodoAD,weight:87.75);
  _GeneralGraph.addEdge(nodoAC,nodo22,weight:58.12);
  _GeneralGraph.addEdge(nodo22,nodo23,weight:51.13);
  _GeneralGraph.addEdge(nodoAB,nodoAD,weight:130.97);
  _GeneralGraph.addEdge(nodoAD,nodoAE,weight:124.80);
  _GeneralGraph.addEdge(nodoAD,nodo23,weight:143.05);
  _GeneralGraph.addEdge(nodoAD,nodo24,weight:114.82);
  _GeneralGraph.addEdge(nodo23,nodo24,weight:55.86);
  _GeneralGraph.addEdge(nodo23,nodoAM,weight:103.46);
  _GeneralGraph.addEdge(nodoAE,nodoAF,weight:59.68);
  _GeneralGraph.addEdge(nodoAF,nodoAG,weight: 20.16);
  _GeneralGraph.addEdge(nodoAF,nodoAI,weight: 29.84); //
  _GeneralGraph.addEdge(nodoAG,nodoAH,weight:31.59);
  _GeneralGraph.addEdge(nodoAG,nodoAI,weight:10.98);
  _GeneralGraph.addEdge(nodoAH,nodo25,weight:10.11);
  _GeneralGraph.addEdge(nodoAI,nodoAJ,weight:139.54);
  _GeneralGraph.addEdge(nodoAJ,nodoAK,weight:55.92);
  _GeneralGraph.addEdge(nodoAK,nodoAL,weight:70.15);
  _GeneralGraph.addEdge(nodoAK,nodo27,weight:104.96);
  _GeneralGraph.addEdge(nodoAL,nodoAM,weight:17.86);
  _GeneralGraph.addEdge(nodoAL,nodoAN,weight:44.10);
  _GeneralGraph.addEdge(nodoAN,nodo26,weight:41.35);

  //
  _GeneralGraph.addEdge(nodo0,aux43,weight:164.66);
  _GeneralGraph.addEdge(aux43,aux42,weight:143.61);
  _GeneralGraph.addEdge(aux42,nodoAJ,weight:143.80);
  _GeneralGraph.addEdge(aux42,aux41,weight:51.26);
  _GeneralGraph.addEdge(aux41,aux40,weight:30.43);
  _GeneralGraph.addEdge(aux40,nodo1,weight:124.89);
  _GeneralGraph.addEdge(aux40,aux39,weight:69.67);
  _GeneralGraph.addEdge(aux39,nodo2,weight:51.64);
  _GeneralGraph.addEdge(nodo2,nodoAH,weight:80.99);
  _GeneralGraph.addEdge(nodo2,aux38,weight:82.66);
  _GeneralGraph.addEdge(aux38,aux37,weight:52.69);
  _GeneralGraph.addEdge(aux38,nodo3,weight:15.73);
  _GeneralGraph.addEdge(aux37,aux36,weight:92.18);
  _GeneralGraph.addEdge(aux36,aux35,weight:50.37);
  _GeneralGraph.addEdge(aux35,aux34,weight:40.42);
  _GeneralGraph.addEdge(aux34,aux24,weight:20.10);

  _GeneralGraph.addEdge(nodo7,aux1,weight:84.67);
  _GeneralGraph.addEdge(aux1,nodo8,weight:61.73);
  _GeneralGraph.addEdge(aux1,aux2,weight:85.10);
  _GeneralGraph.addEdge(aux2,nodo9,weight:102.79);
  _GeneralGraph.addEdge(aux2,aux3,weight:126.39);
  _GeneralGraph.addEdge(aux3,aux4,weight:45.23);
  _GeneralGraph.addEdge(aux3,aux19,weight:108.68);
  _GeneralGraph.addEdge(aux3,aux29,weight:61.95);
  _GeneralGraph.addEdge(aux29,nodo17,weight:11.47);
  //_GeneralGraph.addEdge(aux29,nodo8,weight:77.63);
  _GeneralGraph.addEdge(aux4,nodo16,weight:13.02);
  _GeneralGraph.addEdge(aux31,aux5,weight:188.09);
  _GeneralGraph.addEdge(nodo9,aux31,weight:58.89);//
  _GeneralGraph.addEdge(aux5,aux6,weight:20.82);
  _GeneralGraph.addEdge(aux6,nodo10,weight:12.26);
  _GeneralGraph.addEdge(aux5,aux32,weight:147.85);
  _GeneralGraph.addEdge(aux32,aux7,weight:169.01);
  _GeneralGraph.addEdge(aux33,aux8,weight:75.32);
  _GeneralGraph.addEdge(aux7,aux33,weight: 113.74); /// curva
  _GeneralGraph.addEdge(aux8,nodo11,weight:64.43);
  _GeneralGraph.addEdge(aux7,aux9,weight:86.27);
  _GeneralGraph.addEdge(aux9,nodo12,weight:35.65);
  _GeneralGraph.addEdge(aux9,aux10,weight:61.39);
  _GeneralGraph.addEdge(aux10,nodo13,weight:13.04);
  _GeneralGraph.addEdge(aux10,aux11,weight:81.85);
  _GeneralGraph.addEdge(aux11,aux12,weight:62.28);
  _GeneralGraph.addEdge(aux11,nodoAA,weight:149.53);//
  _GeneralGraph.addEdge(aux12,nodo14,weight:24.56);
  _GeneralGraph.addEdge(aux12,aux13,weight:54.73);
  _GeneralGraph.addEdge(aux13,aux18,weight:64.33);
  _GeneralGraph.addEdge(aux13,aux14,weight:55.10);
  _GeneralGraph.addEdge(aux14,aux15,weight:44.68);
  _GeneralGraph.addEdge(aux15,aux16,weight:32.49);
  _GeneralGraph.addEdge(aux15,nodo15,weight:8.31);
  _GeneralGraph.addEdge(aux16,aux17,weight:38.73);
  _GeneralGraph.addEdge(aux17,aux18,weight:51.42);
  _GeneralGraph.addEdge(aux17,aux19,weight:66.24);

  _GeneralGraph.addEdge(aux19,aux20,weight:188.39);
  _GeneralGraph.addEdge(aux20,nodo18,weight:31.59);
  _GeneralGraph.addEdge(aux20,aux21,weight:130.23);
  _GeneralGraph.addEdge(aux21,nodo19,weight:41.12);
  _GeneralGraph.addEdge(aux21,aux22,weight:18.83);
  _GeneralGraph.addEdge(aux22,aux23,weight:88.35);
  _GeneralGraph.addEdge(aux23,nodo4,weight:11.13);
  _GeneralGraph.addEdge(aux23,aux24,weight:36.49);
  _GeneralGraph.addEdge(aux24,aux25,weight:34.86);
  _GeneralGraph.addEdge(aux25,nodo5,weight:14.35);
  _GeneralGraph.addEdge(aux25,aux26,weight:41.07);
  _GeneralGraph.addEdge(aux26,nodo6,weight:10.46);
  _GeneralGraph.addEdge(aux26,aux27,weight: 77.63);
  _GeneralGraph.addEdge(aux27,aux28,weight: 53.61);
  _GeneralGraph.addEdge(aux28,nodo7,weight: 111.68);
  _GeneralGraph.addEdge(nodo7,aux30,weight: 165.28);
  _GeneralGraph.addEdge(aux30,aux30,weight: 20.84);

  nodos = astar.grafo.vertices;
  _start = nodos.elementAt(2);
  _goal = nodos.elementAt(5);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapsRoutesExample(title: 'GMR Demo Home'),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class MapsRoutesExample extends StatefulWidget {
  const MapsRoutesExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MapsRoutesExampleState createState() => _MapsRoutesExampleState();
}

//Marcadores

class _MapsRoutesExampleState extends State<MapsRoutesExample> {
  Completer<GoogleMapController> _controller = Completer();

  Map<PolylineId, Polyline> _polylines = {};

  Set<Marker> _markers = <Marker>{};

  Set<Polyline> get allpolylines => _polylines.values.toSet();

  List<LatLng> pointPath = <LatLng>[];
  Queue<Vertex<MarcadorPuntos>> ruta = Queue<Vertex<MarcadorPuntos>>();
  MapsRoutes route = MapsRoutes();

  String googleApiKey = 'API_KEY_HERE';
  String totalDistance = 'No route';

  String mensaje = "";

  List<TravelModes> modosViaje = [
    TravelModes.values.elementAt(0),
    TravelModes.values.elementAt(3)
  ];

  Icon iconoModoViaje = const Icon(Icons.directions_sharp);
  var modoViajeElejido = TravelModes.values.elementAt(0);
  String titulo = "Encontrar rutas optimas - UNMSM";
  var selectedValue1;
  var selectedValue2;
  var TituloMensaje = "Mensaje";


  @override
  Widget build(BuildContext context) {
    selectedValue1 = _start.data.nombreLugar;
    selectedValue2 = _goal.data.nombreLugar;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/logo.jpg'),
                ),
              ),
                child: Text(
                  ''
                ),
            ),

            const ListTile(
              leading: Icon(Icons.place_outlined),
              title: Text('Seleccione Punto de Inicio'),
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                ),
                style: const TextStyle(color: Colors.green, fontSize: 18.0),
                value: selectedValue1,
                items: List.generate(
                    getStartPoints().length,
                        (index) => DropdownMenuItem(
                        value: (getStartPoints()[index].data.nombreLugar), child: Text(getStartPoints()[index].data.nombreLugar))),
                onChanged: (newValue) {
                  selectedValue1 = newValue.toString();
                  setState(() {
                    _polylines = {};
                    route = MapsRoutes();
                    _markers = {};
                    for (var element in nodos) {
                      if(element.data.nombreLugar==selectedValue1){
                        _start = element;
                      }
                    }
                  });
                }),

            const ListTile(
              leading: Icon(Icons.place),
              title: Text('Seleccione Punto de Llegada'),
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                ),
                style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                value: selectedValue2,
                items: List.generate(
                    getStartPoints().length,
                        (index) => DropdownMenuItem(
                        value: (getStartPoints()[index].data.nombreLugar), child: Text(getStartPoints()[index].data.nombreLugar))),
                onChanged: (newValue) {
                  selectedValue2 = newValue.toString();
                  setState(() {
                    _polylines = {};
                    route = MapsRoutes();
                    _markers = {};
                    for (var element in nodos) {
                      if(element.data.nombreLugar==selectedValue2){
                        _goal = element;
                      }
                    }
                  });
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(titulo, style: TextStyle(fontSize: 16.0),),
        centerTitle: true,
        actions: <Widget>[
          Ink(
            width: 38.0,
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: CircleBorder(),
            ),
            child: PopupMenuButton<TravelModes>(
              // Callback that sets the selected popup menu item
                icon: iconoModoViaje,
                onSelected: (TravelModes item) {
                  setState(() {
                    if(item.name=="driving"){
                      iconoModoViaje = Icon(Icons.directions_car);
                    }
                    else{
                      iconoModoViaje = Icon(Icons.directions_walk);
                    }
                    modoViajeElejido = item;
                    setState(() {});
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<TravelModes>>[
                  PopupMenuItem<TravelModes>(
                    value: modosViaje[0],
                    child: Text('Carro'),
                  ),
                  PopupMenuItem<TravelModes>(
                    value: modosViaje[1],
                    child: Text('Caminando'),
                  ),
                ]),
          ),
          // This button presents popup menu items.

        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GoogleMap(
                myLocationEnabled: false,
                zoomControlsEnabled: true,
                myLocationButtonEnabled: true,
                polylines: modoViajeElejido == TravelModes.driving ? route.routes : allpolylines,
                initialCameraPosition: const CameraPosition(
                  zoom: 16.9,
                  target: LatLng(-12.054619757195884, -77.08515982417173),
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: _markers,
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                    Text( totalDistance == 'No route' ? totalDistance : 'Distancia: $totalDistance', style: TextStyle(fontSize: 20.0)),
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () async {
              if(_start == _goal){
                mensaje = "El punto de partida y llegada es el mismo";
                _showAlertDialog(context);
                totalDistance = "No route";
              }else{
                await obtenerInicioFinal();
                if(ruta.isNotEmpty){
                  mensaje = "";
                  TituloMensaje = "Ruta a seguir:";
                  for(var nodo in ruta){
                    if(nodo.data.nombreLugar == "Auxiliar"){
                      for(var aux in _GeneralGraph.edges(nodo)){
                        if(aux.destination.data.nombreLugar != "Auxiliar" && aux.destination.data.nombreLugar != _start.data.nombreLugar &&
                            aux.destination.data.nombreLugar != _goal.data.nombreLugar){
                          if(!mensaje.contains(aux.destination.data.nombreLugar)){
                            print(aux.destination.data.nombreLugar);
                            mensaje = mensaje + "\n" + "Cerca de: " + aux.destination.data.nombreLugar;
                          }
                        }
                      }
                    }
                    else{
                      if(!mensaje.contains(nodo.data.nombreLugar)){
                        mensaje = mensaje + "\n" + nodo.data.nombreLugar;
                      }
                    }

              /*if(nodo.data.nombreLugar != "Auxiliar"){
                      mensaje = mensaje + "\n" + nodo.data.nombreLugar;
                    } */
                  }
                  _showAlertDialog(context);
                  if(modoViajeElejido ==TravelModes.driving){
                    await route.drawRoute(pointPath, 'Test routes',
                      Color.fromRGBO(100, 149, 237, 1.0), googleApiKey,
                      travelMode: TravelModes.driving,
                    );
                    setState(() {
                      totalDistance = '${_goal.data.g} m';
                    });
                  }
                  else{
                    drawPolylines();
                  }
                  //
                  totalDistance = '${_goal.data.g} m';
                }
                else{
                  mensaje = "No existe ruta entre $selectedValue1 y $selectedValue2";
                  _showAlertDialog(context);
                }
              }
              //await astar.reiniciarVertices();
              //await obtenerInicioFinal();
              //await getPointPath();
        },
        child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
  void drawPolylines() async{
    _polylines = {};
    const PolylineId polylineId = PolylineId('group');
    late Polyline polyline2;
    for (var element in pointPath) {
      if(_polylines.containsKey(polylineId)){
        final temp = _polylines[polylineId]!;
        polyline2 = temp.copyWith(pointsParam: [...temp.points,element]);
      }
      else{
        polyline2 = Polyline(
          polylineId: polylineId,
          points: [element],
          width: 3,
          color: Colors.black,
        );
      }
      _polylines[polylineId] = polyline2;
    }
  }

  Future<void> obtenerInicioFinal() async{
    for (var element in nodos) {
      if(element.data.nombreLugar==selectedValue1){
        _start = element;
      }
    }
    for (var element in nodos) {
      if(element.data.nombreLugar==selectedValue2){
        _goal = element;
      }
    }
    await getPointPath();
  }
  List<Vertex<MarcadorPuntos>> getStartPoints(){
    List<Vertex<MarcadorPuntos>> puntos= [];
    for (var element in nodos) {
      if(element.data.nombreLugar!="Auxiliar") {
        puntos.add(element);
      }
    }
    return puntos;
  }

  Future<void> getPointPath() async{
    await astar.findPath(_start,_goal).then((Queue<Vertex<MarcadorPuntos>> value){
      setState(() {
        route = new MapsRoutes();
        ruta = value;
        _setMarker();
      });
    });
    pointPath = astar.obtenerPuntos(ruta);

  }
  //Marcadores o Nodos oficiales
  Future<void> _setMarker() async{
    _markers = Set();
    for (var element in ruta) {
      if(element.data.nombreLugar!="Auxiliar"){
        _markers.add(Marker( //add first marker
          markerId: MarkerId('${element.index}'),
          position: LatLng(element.data.latitud,element.data.longitud), //position of marker
          infoWindow: InfoWindow( //popup info
            title: element.data.nombreLugar,
            snippet: '',
          ),
          icon: element.index == _start.index ?
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen) :
          (element.index == _goal.index ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue) : BitmapDescriptor.defaultMarker),
        ));
      }

    }
  }
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('$TituloMensaje'),
        content: Text(
            mensaje,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
                'Cerrar',
            ),
          ),
        ],
      ),
    );
  }
}