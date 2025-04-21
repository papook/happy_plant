import 'species_image.dart';

class PlantDetails {
  final int id;
  final String? commonName;
  final List<String>? scientificName;
  final List<String>? otherName;
  final String? family;
  final String? origin;
  final String? type;
  final Dimensions? dimensions;
  final String? cycle;
  final String? watering;
  final WateringGeneralBenchmark? wateringBenchmark;
  final List<PlantAnatomy>? plantAnatomy;
  final List<String>? sunlight;
  final List<String>? pruningMonth;
  final PruningCount? pruningCount;
  final int? seeds;
  final List<String>? attracts;
  final List<String>? propagation;
  final Hardiness? hardiness;
  final HardinessLocation? hardinessLocation;
  final bool? flowers;
  final String? floweringSeason;
  final List<String>? soil;
  final dynamic pestSusceptibility;
  final bool? cones;
  final bool? fruits;
  final bool? edibleFruit;
  final String? fruitingSeason;
  final String? harvestSeason;
  final String? harvestMethod;
  final bool? leaf;
  final bool? edibleLeaf;
  final String? growthRate;
  final String? maintenance;
  final bool? medicinal;
  final bool? poisonousToHumans;
  final bool? poisonousToPets;
  final bool? droughtTolerant;
  final bool? saltTolerant;
  final bool? thorny;
  final bool? invasive;
  final bool? rare;
  final bool? tropical;
  final bool? cuisine;
  final bool? indoor;
  final String? careLevel;
  final String? description;
  final SpeciesImage defaultImage;
  final List<SpeciesImage>? otherImages;
  final List<String>? xWateringQuality;
  final List<String>? xWateringPeriod;
  final List<String>? xWateringAvgVolumeRequirement;
  final List<String>? xWateringDepthRequirement;
  final TemperatureRange? xWateringBasedTemperature;
  final PhLevel? xWateringPhLevel;
  final SunlightDuration? xSunlightDuration;

  PlantDetails({
    required this.id,
    this.commonName,
    this.scientificName,
    this.otherName,
    this.family,
    this.origin,
    this.type,
    this.dimensions,
    this.cycle,
    this.watering,
    this.wateringBenchmark,
    this.plantAnatomy,
    this.sunlight,
    this.pruningMonth,
    this.pruningCount,
    this.seeds,
    this.attracts,
    this.propagation,
    this.hardiness,
    this.hardinessLocation,
    this.flowers,
    this.floweringSeason,
    this.soil = const [],
    this.pestSusceptibility,
    this.cones,
    this.fruits,
    this.edibleFruit,
    this.fruitingSeason,
    this.harvestSeason,
    this.harvestMethod,
    this.leaf,
    this.edibleLeaf,
    this.growthRate,
    this.maintenance,
    this.medicinal,
    this.poisonousToHumans,
    this.poisonousToPets,
    this.droughtTolerant,
    this.saltTolerant,
    this.thorny,
    this.invasive,
    this.rare,
    this.tropical,
    this.cuisine,
    this.indoor,
    this.careLevel,
    this.description,
    required this.defaultImage,
    this.otherImages,
    this.xWateringQuality,
    this.xWateringPeriod,
    this.xWateringAvgVolumeRequirement,
    this.xWateringDepthRequirement,
    this.xWateringBasedTemperature,
    this.xWateringPhLevel,
    this.xSunlightDuration,
  });

  factory PlantDetails.fromJson(Map<String, dynamic> json) {
    return PlantDetails(
      id: json['id'] as int,
      commonName: json['common_name'] as String?,
      scientificName:
          (json['scientific_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      otherName:
          (json['other_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      family: json['family'] as String?,
      origin: json['origin'] as String?,
      type: json['type'] as String?,
      dimensions:
          json['dimensions'] != null
              ? Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>)
              : null,
      cycle: json['cycle'] as String?,
      watering: json['watering'] as String?,
      wateringBenchmark:
          json['watering_general_benchmark'] != null
              ? WateringGeneralBenchmark.fromJson(
                json['watering_general_benchmark'] as Map<String, dynamic>,
              )
              : null,
      plantAnatomy:
          (json['plant_anatomy'] as List<dynamic>?)
              ?.map((e) => PlantAnatomy.fromJson(e as Map<String, dynamic>))
              .toList(),
      sunlight:
          (json['sunlight'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      pruningMonth:
          (json['pruning_month'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      pruningCount:
          json['pruning_count'] != null
              ? PruningCount.fromJson(
                json['pruning_count'] as Map<String, dynamic>,
              )
              : null,
      seeds: json['seeds'] as int?,
      attracts:
          (json['attracts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      propagation:
          (json['propagation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      hardiness:
          json['hardiness'] != null
              ? Hardiness.fromJson(json['hardiness'] as Map<String, dynamic>)
              : null,
      hardinessLocation:
          json['hardiness_location'] != null
              ? HardinessLocation.fromJson(
                json['hardiness_location'] as Map<String, dynamic>,
              )
              : null,
      flowers: json['flowers'] as bool?,
      floweringSeason: json['flowering_season'] as String?,
      soil:
          (json['soil'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      pestSusceptibility: json['pest_susceptibility'],
      cones: json['cones'] as bool?,
      fruits: json['fruits'] as bool?,
      edibleFruit: json['edible_fruit'] as bool?,
      fruitingSeason: json['fruiting_season'] as String?,
      harvestSeason: json['harvest_season'] as String?,
      harvestMethod: json['harvest_method'] as String?,
      leaf: json['leaf'] as bool?,
      edibleLeaf: json['edible_leaf'] as bool?,
      growthRate: json['growth_rate'] as String?,
      maintenance: json['maintenance'] as String?,
      medicinal: json['medicinal'] as bool?,
      poisonousToHumans: json['poisonous_to_humans'] as bool?,
      poisonousToPets: json['poisonous_to_pets'] as bool?,
      droughtTolerant: json['drought_tolerant'] as bool?,
      saltTolerant: json['salt_tolerant'] as bool?,
      thorny: json['thorny'] as bool?,
      invasive: json['invasive'] as bool?,
      rare: json['rare'] as bool?,
      tropical: json['tropical'] as bool?,
      cuisine: json['cuisine'] as bool?,
      indoor: json['indoor'] as bool?,
      careLevel: json['care_level'] as String?,
      description: json['description'] as String?,
      defaultImage: SpeciesImage.fromJson(
        json['default_image'] as Map<String, dynamic>,
      ),
      otherImages:
          (json['other_images'] as List<dynamic>?)
              ?.map((e) => SpeciesImage.fromJson(e as Map<String, dynamic>))
              .toList(),
      xWateringQuality:
          (json['xWateringQuality'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      xWateringPeriod:
          (json['xWateringPeriod'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      xWateringAvgVolumeRequirement:
          (json['xWateringAvgVolumeRequirement'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      xWateringDepthRequirement:
          (json['xWateringDepthRequirement'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      xWateringBasedTemperature:
          json['xWateringBasedTemperature'] != null
              ? TemperatureRange.fromJson(
                json['xWateringBasedTemperature'] as Map<String, dynamic>,
              )
              : null,
      xWateringPhLevel:
          json['xWateringPhLevel'] != null
              ? PhLevel.fromJson(
                json['xWateringPhLevel'] as Map<String, dynamic>,
              )
              : null,
      xSunlightDuration:
          json['xSunlightDuration'] != null
              ? SunlightDuration.fromJson(
                json['xSunlightDuration'] as Map<String, dynamic>,
              )
              : null,
    );
  }
}

class Dimensions {
  final String? type;
  final double? minValue;
  final double? maxValue;
  final String? unit;

  Dimensions({this.type, this.minValue, this.maxValue, this.unit});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      type: json['type'] as String?,
      minValue: (json['min_value'] as num?)?.toDouble(),
      maxValue: (json['max_value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );
  }
}

class WateringGeneralBenchmark {
  final String? value;
  final String? unit;

  WateringGeneralBenchmark({this.value, this.unit});

  factory WateringGeneralBenchmark.fromJson(Map<String, dynamic> json) {
    return WateringGeneralBenchmark(
      value: json['value']?.toString(),
      unit: json['unit'] as String?,
    );
  }
}

class PlantAnatomy {
  final String? part;
  final List<String>? color;

  PlantAnatomy({this.part, this.color});

  factory PlantAnatomy.fromJson(Map<String, dynamic> json) {
    return PlantAnatomy(
      part: json['part'] as String?,
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}

class PruningCount {
  final int? amount;
  final String? interval;

  PruningCount({this.amount, this.interval});

  factory PruningCount.fromJson(Map<String, dynamic> json) {
    return PruningCount(
      amount: json['amount'] as int?,
      interval: json['interval'] as String?,
    );
  }
}

class Hardiness {
  final String? min;
  final String? max;

  Hardiness({this.min, this.max});

  factory Hardiness.fromJson(Map<String, dynamic> json) {
    return Hardiness(min: json['min'] as String?, max: json['max'] as String?);
  }
}

class HardinessLocation {
  final String? fullUrl;
  final String? fullIframe;

  HardinessLocation({this.fullUrl, this.fullIframe});

  factory HardinessLocation.fromJson(Map<String, dynamic> json) {
    return HardinessLocation(
      fullUrl: json['full_url'] as String?,
      fullIframe: json['full_iframe'] as String?,
    );
  }
}

class TemperatureRange {
  final String? unit;
  final double? min;
  final double? max;

  TemperatureRange({this.unit, this.min, this.max});

  factory TemperatureRange.fromJson(Map<String, dynamic> json) {
    return TemperatureRange(
      unit: json['unit'] as String?,
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );
  }
}

class PhLevel {
  final double? min;
  final double? max;

  PhLevel({this.min, this.max});

  factory PhLevel.fromJson(Map<String, dynamic> json) {
    return PhLevel(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );
  }
}

class SunlightDuration {
  final String? unit;
  final String? min;
  final String? max;

  SunlightDuration({this.unit, this.min, this.max});

  factory SunlightDuration.fromJson(Map<String, dynamic> json) {
    return SunlightDuration(
      unit: json['unit'] as String?,
      min: json['min'] as String?,
      max: json['max'] as String?,
    );
  }
}
