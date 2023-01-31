class LocationCityDetails {
  String currentcity;
  String markets;
  String rainfall;
  String temperature;
  String soilType;
  String soilPh;
  String availableWaterBodies;
  String tractability;
  int id;
  LocationCityDetails({
    required this.currentcity,
    required this.markets,
    required this.rainfall,
    required this.temperature,
    required this.soilType,
    required this.soilPh,
    required this.availableWaterBodies,
    required this.tractability,
    required this.id,
  });
}

final List<LocationCityDetails> locationDetailsItems = <LocationCityDetails>[
  LocationCityDetails(
    id: 0,
    currentcity: "Agbogugu",
    markets: " Orio Agbogugu",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Deep clay loam soil",
    soilPh: "3.9 - 4.6",
    availableWaterBodies: "Nvula Agbogugu",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 1,
    currentcity: "Amoli",
    markets: " Nkwo Uda-amoli",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Deep clay loam soil",
    soilPh: "4.9 - 5.9",
    availableWaterBodies: "Anizi River",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 2,
    currentcity: "Awgu",
    markets: "  Orio Awgu",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Alluvial Soil",
    soilPh: "3.6 - 5.2",
    availableWaterBodies: "Null",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 3,
    currentcity: "Ezere",
    markets: " Nkwo Ezere",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Deep clay loam soil",
    soilPh: "3.9 - 5.6",
    availableWaterBodies: "Iyioma",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 4,
    currentcity: "Mgbidi",
    markets: " Nkwo Mgbidi",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Sandy loam soil",
    soilPh: "4.7 - 6.1",
    availableWaterBodies: "  4 catchments",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 5,
    currentcity: "Ihe",
    markets: " Eke Ihe",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Sandy loam soil",
    soilPh: "4.2 - 5.4",
    availableWaterBodies: " null",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 6,
    currentcity: "Mgbowo",
    markets: " Eke Mgbowo",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Alluvial soil",
    soilPh: "4.1 - 5.9",
    availableWaterBodies: "Ezioha dam",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 7,
    currentcity: "Mmaku",
    markets: " Aho Mmaku, Eke Mmaku",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "Shallow lithosol soil",
    soilPh: "4.1 - 5.9",
    availableWaterBodies: "Mmamu River,Mmaku",
    tractability: "loading...",
  ),
  LocationCityDetails(
    id: 8,
    currentcity: "Nkwe",
    markets: "  Eke Nkwe",
    rainfall: 'loading..',
    temperature: 'loading...',
    soilType: "shallow lithosol soil",
    soilPh: "3.8 - 5.4",
    availableWaterBodies: "Ezioha dam",
    tractability: "loading...",
  ),
];
