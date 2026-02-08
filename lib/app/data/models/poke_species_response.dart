class PokeSpeciesResponse {
  int? baseHappiness;
  int? captureRate;
  DataSpecies? color;
  List<DataSpecies>? eggGroups;
  EvolutionChain? evolutionChain;
  List<FlavorTextEntries>? flavorTextEntries;
  bool? formsSwitchable;
  int? genderRate;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;
  List<PalParkEncounters>? palParkEncounters;

  PokeSpeciesResponse({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,

    this.flavorTextEntries,
    this.formsSwitchable,
    this.genderRate,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.order,
    this.palParkEncounters,
  });

  PokeSpeciesResponse.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = json['color'] != null ? DataSpecies.fromJson(json['color']) : null;
    if (json['egg_groups'] != null) {
      eggGroups = <DataSpecies>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(DataSpecies.fromJson(v));
      });
    }
    evolutionChain = json['evolution_chain'] != null
        ? new EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorTextEntries.fromJson(v));
      });
    }

    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    order = json['order'];
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = <PalParkEncounters>[];
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters!.add(PalParkEncounters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_happiness'] = baseHappiness;
    data['capture_rate'] = captureRate;
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (eggGroups != null) {
      data['egg_groups'] = eggGroups!.map((v) => v.toJson()).toList();
    }
    if (evolutionChain != null) {
      data['evolution_chain'] = evolutionChain!.toJson();
    }

    if (flavorTextEntries != null) {
      data['flavor_text_entries'] = flavorTextEntries!
          .map((v) => v.toJson())
          .toList();
    }

    data['forms_switchable'] = formsSwitchable;
    data['gender_rate'] = genderRate;

    data['has_gender_differences'] = hasGenderDifferences;
    data['hatch_counter'] = hatchCounter;
    data['id'] = id;
    data['is_baby'] = isBaby;
    data['is_legendary'] = isLegendary;
    data['is_mythical'] = isMythical;
    data['name'] = name;

    data['order'] = order;
    if (palParkEncounters != null) {
      data['pal_park_encounters'] = palParkEncounters!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class DataSpecies {
  String? name;
  String? url;

  DataSpecies({this.name, this.url});

  DataSpecies.fromJson(Map<String, dynamic> json) {
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

class EvolutionChain {
  String? url;

  EvolutionChain({this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;

  FlavorTextEntries({this.flavorText});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    return data;
  }
}

class PalParkEncounters {
  DataSpecies? area;
  int? baseScore;
  int? rate;

  PalParkEncounters({this.area, this.baseScore, this.rate});

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? DataSpecies.fromJson(json['area']) : null;
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (area != null) {
      data['area'] = area!.toJson();
    }
    data['base_score'] = baseScore;
    data['rate'] = rate;
    return data;
  }
}
