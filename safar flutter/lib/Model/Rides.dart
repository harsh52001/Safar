
import 'dart:convert';
import 'package:http/http.dart'as http;

List<Rides> ridesFromJson(String str) => List<Rides>.from(json.decode(str).map((x) => Rides.fromJson(x)));

String ridesToJson(List<Rides> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rides {
    String? id;
    String? origin;
    String? destination;
    DateTime? dateTime;
    int? availableCapacity;
    String? vehicleId;
    String? driver;
    List<String>? passengers;
    int? v;

    Rides({
        this.id,
        this.origin,
        this.destination,
        this.dateTime,
        this.availableCapacity,
        this.vehicleId,
        this.driver,
        this.passengers,
        this.v,
    });

    factory Rides.fromJson(Map<String, dynamic> json) => Rides(
        id: json["_id"],
        origin: json["origin"],
        destination: json["destination"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        availableCapacity: json["availableCapacity"],
        vehicleId: json["vehicleId"],
        driver: json["driver"],
        passengers: json["passengers"] == null ? [] : List<String>.from(json["passengers"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "origin": origin,
        "destination": destination,
        "dateTime": dateTime?.toIso8601String(),
        "availableCapacity": availableCapacity,
        "vehicleId": vehicleId,
        "driver": driver,
        "passengers": passengers == null ? [] : List<dynamic>.from(passengers!.map((x) => x)),
        "__v": v,
    };

    Future<List<Rides>?> getRideList(String origin,String dest)async{
      List<Rides> list = [];
      var res = await http.post(Uri.parse("http://192.168.7.197:3000/api/rides/search"),body: json.encode({"origin": origin,"destination":dest}));
      if(res != null && res.statusCode == 200){
        list = ridesFromJson(res.body);
        list.add(Rides.fromJson({
        "_id": "661cb36034ac0b0e0cae1f28",
        "origin": "now",
        "destination": "now",
        "dateTime": "2024-05-06T04:03:04.817Z",
        "availableCapacity": 2,
        "vehicleId": "Rj14CB6556",
        "driver": "keshav",
        "passengers": [
            "harsh"
        ],
        "__v": 0
    }));
        return list;
      }
      return [];
    }
}
