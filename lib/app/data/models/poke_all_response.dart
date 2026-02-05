class PokeAllResponse {
  int? count;
  String? next;
  String? previous;
  List<DataPoke>? results;

  PokeAllResponse({this.count, this.next, this.previous, this.results});

  PokeAllResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <DataPoke>[];
      json['results'].forEach((v) {
        results!.add(DataPoke.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPoke {
  String? name;
  String? url;

  DataPoke({this.name, this.url});

  DataPoke.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}