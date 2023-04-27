import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {

}
class MarcadorPuntos{
  late double latitud;
  late double longitud;
  late String nombreLugar;
  late double f = 0.0;
  late double g = 0.0;
  late double heuristic = 0.0;
  Vertex<MarcadorPuntos>? parent;
  MarcadorPuntos(
    this.latitud,
    this.longitud,
    this.nombreLugar,
    this.parent,
  );
  bool isInOpen = false;
  bool isInClose = false;
}

class Vertex<T> {
  const Vertex({
    required this.index,
    required this.data,
  });
  final int index;
  final T data;
  @override
  String toString() => data.toString();
}

class Edge<T> {
  const Edge(
      this.source,
      this.destination,
      [this.weight,]
      );
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}
enum EdgeType { directed, undirected }
abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;
  Vertex<E> createVertex(E data);//
  void addEdge(Vertex<E> source,Vertex<E> destination,{ EdgeType edgeType,double? weight,});
  List<Edge<E>> edges(Vertex<E> source);
  double? weight(Vertex<E> source,Vertex<E> destination,);
  double? heuristic(Vertex<MarcadorPuntos> source, Vertex<MarcadorPuntos> destination,);
}
class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;
  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;
  @override
  Vertex<E> createVertex(E data) { //
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }
  @override
  void addEdge(Vertex<E> source, Vertex<E> destination,
      {EdgeType edgeType = EdgeType.undirected,double? weight,}){
    _connections[source]?.add(
      Edge(source, destination, weight),
    );
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(
        Edge(destination, source, weight),
      );
    }
  }
  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }
  @override
  double? weight(Vertex<E> source,Vertex<E> destination,){
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }
  @override
  double? heuristic(Vertex<MarcadorPuntos> source, Vertex<MarcadorPuntos> destination,){
    double sourceLat = source.data.latitud;
    double sourceLong = source.data.longitud;
    double destinationLat = destination.data.latitud;
    double destinationLong = destination.data.longitud;
    double lineDistance = Geolocator.distanceBetween(sourceLat, sourceLong, -destinationLat, destinationLong);
    return lineDistance;
  }
  @override
  String toString() {
    final result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination.index;
      }).join(', ');
      result.writeln('${vertex.index} --> $destinations');
    });
    return result.toString();
  }
}

class AStar{
  final AdjacencyList<MarcadorPuntos> grafo;
  AStar(this.grafo);
  List<Vertex<MarcadorPuntos>> openList = [];

  Future<void> reiniciarVertices() async{
    for (var value in grafo.vertices) {
      value.data.isInClose = false;
      value.data.isInOpen = false;
    }
  }
  Future<Queue<Vertex<MarcadorPuntos>>> findPath(Vertex<MarcadorPuntos> start, Vertex<MarcadorPuntos> goal) async{
    await this.reiniciarVertices();
    openList = [];

    var bestNodoIndex = 0;
    openList.add(start);
    start.data.isInOpen = true;
    start.data.g = 0;
    start.data.f = start.data.g + start.data.heuristic;
    var bestCost = start.data.f;
    Vertex<MarcadorPuntos> current = Vertex<MarcadorPuntos>(index: -1,data: MarcadorPuntos(0.0, 0.0,"",null));
    while(openList.isNotEmpty){
      if(openList[0].index!=goal.index){
        bestCost = openList[0].data.f;
      }else{
        bestNodoIndex=0;
      }
      for(var i=0;i<openList.length;i++){
        if(openList[i].data.f<=bestCost&&openList[0].index!=goal.index){
          bestCost = openList[i].data.f;
          bestNodoIndex = i;
        }
      }
      current = openList[bestNodoIndex];
      openList.removeAt(bestNodoIndex);
      if(current == goal){
        break;
      }
      current.data.isInOpen = false;
      current.data.isInClose = true;
      for(var neighbour in grafo.edges(current)){
        final distance = grafo.weight(current,neighbour.destination);
        if(!neighbour.destination.data.isInClose){
          if(!neighbour.destination.data.isInOpen){
            neighbour.destination.data.parent = current;
            neighbour.destination.data.g = current.data.g + distance!;
            final h = grafo.heuristic(current, goal);
            neighbour.destination.data.f = neighbour.destination.data.g + h!;
            openList.add(neighbour.destination);
            neighbour.destination.data.isInOpen = true;
          }
          else{
            if(openList.contains(neighbour.destination)){
              var indice = openList.indexOf(neighbour.destination);
              if(current.data.g+distance!<openList[indice].data.g){
                openList[indice].data.g = current.data.g+distance;
                final h = grafo.heuristic(openList[indice], goal);
                openList[indice].data.f = openList[indice].data.g + h!;
                openList[indice].data.parent = current;
              }
            }

          }
        }

      }
    }
    return getRoute(current, start, goal);
  }
  Queue<Vertex<MarcadorPuntos>> getRoute(Vertex<MarcadorPuntos> current,Vertex<MarcadorPuntos>start,Vertex<MarcadorPuntos>goal){
    final Queue<Vertex<MarcadorPuntos>> path = Queue();
    path.add(goal);
    if(start!=goal) {
      while (current.data.parent != null) {
        current = current.data.parent!;
        path.addFirst(current);
      }
    }
    return path;
  }
  List<LatLng> obtenerPuntos(Queue<Vertex<MarcadorPuntos>> ruta){
    List<LatLng> points = [];
    for(var i=0;i<ruta.length;i++){
      points.add(LatLng(ruta.elementAt(i).data.latitud, ruta.elementAt(i).data.longitud));
    }
    return points;
  }
}