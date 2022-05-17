class LocationCityDetails {
  String currentcity;
  String markets;
  String rainfall;
  String currentTemperature;
  String soilType;
  String soilPh;
  String availableWaterBodies;
  String tractability;
  int id;
  LocationCityDetails({
    required this.currentcity,
    required this.markets,
    required this.rainfall,
    required this.currentTemperature,
    required this.soilType,
    required this.soilPh,
    required this.availableWaterBodies,
    required this.tractability,
    required this.id,
  });
  static List<LocationCityDetails> locationDetailsItems = <LocationCityDetails>[
    LocationCityDetails(
      id: 0,
      currentcity: "Agbogugu",
      markets: " Orio Agbogugu",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
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
      currentTemperature: 'loading...',
      soilType: "Shallow lithosol soil",
      soilPh: "4.1 - 5.9",
      availableWaterBodies: "Mmamu River, Omoh Mmaku",
      tractability: "loading...",
    ),
    LocationCityDetails(
      id: 8,
      currentcity: "Nkwe",
      markets: "  Eke Nkwe",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "shallow lithosol soil",
      soilPh: "3.8 - 5.4",
      availableWaterBodies: "Ezioha dam",
      tractability: "loading...",
    ),
  ];
}

//
// City: Agbogugu
// Markets: Orio Agbogugu
// Rainfall: loading...
// Current temp: loading...
// Soil: Deep clay loam soil
// Soil pH range: 3.9 - 4.6
// Water bodies: Nvula Agbogugu
// Tractability: loading...
//
// City: Amoli
// Market: Nkwo Uda-amoli
// Rainfall: loading...
// Temp: loading...
// Soil: Deep clay loam soil
// Soil pH range: 4.9 - 5.9
// Water: Anizi River
// Tractability: loading...
//
// City: Awgu
// Markets: Orio Awgu
// Rainfall: loading...
// Current temp: loading...
// Soil type: Alluvial Soil
// Soil pH range: 3.6 - 5.2
// Water bodies: Null
// Tractability: loading...
//
//
// City: Ezere
// Market: Nkwo Ezere
// Rainfall: loading...
// Temp: loading...
// Soil: Deep clay loam soil
// Soil pH range: 3.9 - 5.6
// Water: Iyioma
// Tractability: loading...
//
// City: Ihe
// Markets: Eke Ihe
// Rainfall: loading...
// Current temp: loading...
// Soil: Sandy loam soil
// Soil pH range: 4.2 - 5.4
// Water bodies: Null
// Tractability: loading...
//
// City: Mgbidi
// Market: Nkwo Mgbidi
// Rainfall: loading...
// Temp: loading...
// Soil: Sandy loam soil
// Soil pH range: 4.7 - 6.1
// Water: 4 catchments
// Tractability: loading...
//
// City: Mgbowo
// Markets: Eke Mgbowo
// Rainfall: loading...
// Current temp: loading...
// Soil: Alluvial soil
// Soil pH range: 4.1 - 5.9
// Water bodies: Ezioha dam
// Tractability: loading...
//
// City: Mmaku
// Market: Aho Mmaku, Eke Mmaku
// Rainfall: loading...
// Temp: loading...
// Soil: Shallow lithosol soil
// Soil pH range: 4.1 - 5.9
// Water: Mmamu River, Omoh Mmaku
// Tractability: loading...
//
// City: Nkwe
// Markets: Eke Nkwe
// Rainfall: loading...
// Current temp: loading...
// Soil: shallow lithosol soil
// Soil pH range: 3.8 - 5.4
// Water bodies: Null
// Tractability: loading...
//
// City: Owelli
// Market: Nkwo Owelli
// Rainfall: loading...
// Temp: loading...
// Soil: Shallow lithosol soil
// Soil pH range: 3.9 - 5.6
// Water: 3 catchments
// Tractability: loading...
