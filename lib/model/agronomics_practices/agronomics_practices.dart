class AgronomicsPractices {
  String cropName;
  String cropImage;
  String cropFamily;
  String botanicalName;
  String requiredRainfall;
  String requiredTemperature;
  String soilRequirement;
  String requiredSoilPH;
  String shadeTolerance;
  String waterLoggedTolerance;
  String droughtResistance;
  String irrigation;
  String maturityPeriod;
  String landPreparation;
  String tillageOperation;
  String plantingMaterials;
  String plantingMethods;
  String plantingDate;
  String seedRateYield;
  String weedControl;
  String staking;
  String fertilizerApplication;
  String pestControl;
  String pest;
  String disease;
  String symptoms;
  String pestDiseaseControl;
  String diseaseControl;
  String harvest;
  String processing;
  String storage;
  String products;
  String processingMachines;
  String packaging;
  String processingTools;
  String uses;
  String economicImportance;
  Function riskAssessment;

  AgronomicsPractices(
      {required this.cropName,
      required this.cropImage,
      required this.diseaseControl,
      required this.cropFamily,
      required this.botanicalName,
      required this.requiredRainfall,
      required this.requiredTemperature,
      required this.soilRequirement,
      required this.requiredSoilPH,
      required this.shadeTolerance,
      required this.waterLoggedTolerance,
      required this.droughtResistance,
      required this.irrigation,
      required this.maturityPeriod,
      required this.landPreparation,
      required this.tillageOperation,
      required this.plantingMaterials,
      required this.plantingMethods,
      required this.plantingDate,
      required this.seedRateYield,
      required this.weedControl,
      required this.staking,
      required this.fertilizerApplication,
      required this.pestControl,
      required this.pest,
      required this.disease,
      required this.symptoms,
      required this.pestDiseaseControl,
      required this.harvest,
      required this.processing,
      required this.storage,
      required this.products,
      required this.processingMachines,
      required this.packaging,
      required this.processingTools,
      required this.uses,
      required this.economicImportance,
      required this.riskAssessment});
}

List<AgronomicsPractices> agroPractices = <AgronomicsPractices>[
  AgronomicsPractices(
    cropName: 'Yam',
    cropImage: 'assets/crops/yam.png',
    cropFamily: 'Dioscoreaceae',
    botanicalName: "Dioscorea SPP",
    requiredRainfall:
        "1000 – 1500 mm of rainfall well distributed over a period of 6 -7 months",
    requiredTemperature: "An average of 25 – 30°C",
    soilRequirement: "Deep, well-drained loamy soil",
    requiredSoilPH: "4 – 6",
    shadeTolerance: "No",
    waterLoggedTolerance: "No",
    droughtResistance: "Yes",
    irrigation: "No",
    maturityPeriod: "6 – 12 months",
    landPreparation:
        "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
    tillageOperation:
        "Use local hoes or diggers to make ridges, mounds, holes or flats for small farm holdings. For commercial production the conventional system should be used (disc plough-->disc-->ridger).",
    plantingMaterials: "Seed yams (whole tuber), Yam sett and yam mini-sett.",
    plantingMethods:
        "Use whole tuber or seed yams to produce ware yams and yam sett or yam mini-sett to produce seed yams. Treat sett cuts with Act-force gold, Z-force and other fungicide to protect it from soil-borne pathogens.",
    plantingDate: "February to April",
    seedRateYield:
        "At a spacing of 25cm X 100cm or 25cm X 75cm and depth of 20cm to 25cm, 40,000 plant stands could be produced per ha.",
    weedControl: "Can be done manually, mechanically or chemically.",
    staking: "Should be done when the vines are about 1 to 1.5m long.",
    fertilizerApplication:
        "compound fertilizer N.P.K 15:15:15 at the rate of 400 – 500kg/ha.",
    pest:
        "Yam beetle, spider, rodent, ants, bacteria, fungi, nematodes, human etc",
    disease: "Mosaic virus disease, Anthracnose disease.",
    pestDiseaseControl:
        "To control pest, farmers are advised to use traps, fence, poisoning, alongside fungicides, pesticides and nematicides. For cultural practice, late planting helps reduce beetle attack.",
    harvest:
        "Seed yams mature 6 - 7 months after planting or transplanting. Leaves turn yellow and die 5 - 6 months after planting followed by the drying up and death of vines. Harvest using hoe, digger, cutlass, pear etc.",
    processing: "Process in to other forms or cooking directly as food.",
    storage: "Tie up and store in bans under shade.",
    products:
        "pounded yam/Amala, Boiled, fried/roasted yam,Starch, yam flour, poultry feed.",
    processingMachines:
        "Yam slicer, hammer mill, dryer, grater, boiler, weighing scale, sieve, sealing machines.",
    packaging: "polythene or nylon bags are used for packaging yam flour.",
    diseaseControl:
        'Use healthy and disease free tubers or setts for planting. Select healthy and large tubers for planting instead of small tubers. Keep fields free from weeds. Collect crop debris and destroy them.',
    pestControl:
        'To control pest, farmers are advised to use traps, fence, poisoning, alongside fungicides, pesticides and nematicides. For cultural practice, late planting helps reduce beetle attack.',
    symptoms:
        'infected plant leaves show yellow and green patterns (called mosaics) between the veins or may show narrow green strips bordering the veins (called vein banding). If the disease is severe the leaves become long, thin and sharp shape (called shoe-string symptom) and whole plant become stunted.',
    processingTools: '',
    uses: '',
    economicImportance: '',
    riskAssessment: () {},
  ),
  AgronomicsPractices(
    cropName: 'Coco Yam',
    cropImage: 'assets/crops/cocoyam.png',
    cropFamily: 'Araceae - Arums',
    botanicalName: "Colocasia SPP",
    // " & Xanthosoma SPP",
    requiredRainfall: "Above 2000mm per annum for optimum yield",
    requiredTemperature:
        "Xanthosoma specie require 21 to 25°C Colocasia specie requires lower temperature of below 21°C but will damage at temperature below 10°C",
    soilRequirement:
        "Xanthosoma require fertile, well-drained sandy soil. Colocasia require deep, well-drained loamy soil",
    requiredSoilPH: "4.2 – 7.5 for Xanthosoma, 5.5 – 6.5 for Colocasia",
    shadeTolerance: "Yes for both species",
    waterLoggedTolerance: "Yes for Xanthosoma, No for Colocasia.",
    droughtResistance: "No for Xanthosoma Yes for Colocasia",
    irrigation: "Yes for Xanthosoma, No for Colocasia",
    maturityPeriod:
        "10 – 11 months after planting for Colocasia and 7 – 8 months for Xanthosoma.",
    landPreparation:
        "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
    tillageOperation:
        "mounds or ridges can be made 1m X 1m apart Manually by use of hoe or mechanically by a tractor coupled secondary tillage implement (ridger).",
    plantingMaterials: "Healthy head setts / suckers",
    plantingMethods:
        "Cocoyam is propagated in such a way that enhances sucker growth. The planting material is set in furrows or ridges with optimum spacing.",
    plantingDate: "March - May ",
    seedRateYield:
        "Head setts should be planted 1m X 1m apart at a depth of 15 – 20cm to produce 10000 plant stands per ha and an approximate yield of 4 -10ton/ha",
    weedControl: "Can be done manually or chemically.",
    staking: "null",
    fertilizerApplication:
        "N.P.K 15:15:15 should be applied at a measure of 5 - 6 beer bottle capfuls in a ring form about 10cm away from the plant.",
    pestControl:
        'Apply liquid or powdered insecticides and set up traps to control pests.',
    pest:
        "white ants cause damage on the tubers at any stage of development or even in storage. Others include rodents that eat the corms on field.",
    disease: "Fungus attack cocoyam plant",
    diseaseControl:
        'Treat with fungicide as symptoms show up. In severe attack, uproot the affected plants and bury or burn them.',
    pestDiseaseControl:
        "In severe attack, uproot the affected plant and bury or burn it. Apply fungicide and insecticides when needed.",
    harvest:
        "most cocoyam varieties mature in about 8 months after planting. Harvest is done by shaking up the plant, uprooting it and bringing out the cormels while those cormels that remain in the soil are dug out. Corms should not be injured for proper storage.",
    processing:
        "Sliced and dried into chips (achicha), Dried and milled to produce cocoyam powder",
    storage:
        "Corms should be cleaned and arranged on raised platforms. They can also be stored in a shady place in the field, huts, bans or pits.",
    products:
        "Cocoyam flour, Cocoyam chips, Cocoyam leaves are also edible as vegetable, Cocoyam is a highly medicinal plant.",
    processingMachines: "slicer, hammer mill, dryer.",
    packaging: "sacks, polythene/nylon",
    symptoms:
        'Leaves turn yellow prematurely as the entire plant wilts and damping off of the seedlings may also occur.',
    processingTools: '',
    economicImportance: '',
    uses: '', riskAssessment: () {},
  ),
  AgronomicsPractices(
    riskAssessment: () {},
    cropName: 'Cassava',
    cropImage: 'assets/crops/cassava.png',
    cropFamily: 'Eupherbiaceae',
    botanicalName: "Manihot SPP",
    requiredRainfall: "1000mm or more for optimum yield",
    requiredTemperature: "25 - 35°C",
    soilRequirement: "Fertile, well-drained sandy loam soil ",
    requiredSoilPH: "5 - 6",
    shadeTolerance: "No",
    waterLoggedTolerance: "No",
    droughtResistance: "Yes",
    irrigation: "No",
    maturityPeriod: "10 – 24 months",
    landPreparation:
        "Can be done manually by use of cutlass, hoe, digger, shovel etc. It can also be done mechanically by use of mowers or chemically by application of herbicides on the field.",
    tillageOperation:
        "Mounds or ridges can be made manually by use of hoe or mechanically with a tractor",
    plantingMaterials: "Stem cuttings.",
    plantingMethods:
        "Cassava stems from matured plants (12 months old) are stored for 2 -5 days for sprouting before cutting in to short stems of 25cm length with a sharp knife. The middle potion of the stem should be used avoiding the tip and root potion. Plant vertically or diagonally during high rainfall and horizontally during low rainfall.",
    plantingDate: "April - October",
    seedRateYield:
        "stems should be planted 1m X 1m apart to accommodate large canopies. Thereby producing 10000 plant stands /ha",
    weedControl: "Can be done manually or chemically.",
    staking: "null",
    fertilizerApplication:
        "With the right soil there is no need for fertilizer. For a poor soil and a high requirement for potassium it is best to use potassium sulphate (k2SO4) to enrich the soil. Fertilizer should be placed at a considerable distance between crop stands",
    pestControl:
        'Pest can be controlled by use of traps, fence and grain poisoning.',
    diseaseControl:
        'For disease control, uproot and burn affected plant and also practice crop rotation. ',
    pest:
        "Cassava mealy bug, cassava green spider mite, termites, grasshopper and Rodents.",
    disease:
        "Cassava Mosaic Disease (CMD), Cassava Root Rot (CRR), Cassava Bacteria Blight (CBB).",
    symptoms:
        'Both old and young plants have yellowish area (chlorosis) with leaves deformation and distortion.',
    pestDiseaseControl:
        "control pest using traps, fence and grain poisoning. For disease control, uproot and burn affected plant and also practice crop rotation.",
    harvest:
        "Mature cassava can be harvested locally using cutlass, hoe or digger. And mechanically using cassava harvester or cassava lifters.",
    processing:
        "Peeling, grating and frying to produce, Peeling, drying and milling to produce, Peeling, soaking, filtering and boiling to produce boiling, grating, and drying, Can also be used as animal feed.",
    storage: "It can be stored in sacks",
    products:
        "cassava chips (abacha), fufu (akpu), cassava flour (alibo), cassava flake (garri), starch, bio-ethanol, animal feed.",
    processingMachines:
        "mechanical peelers, mechanical chippers, mechanical grater, hammer mill, hydraulic dewatering machine, cabinet dryer, flash dryer and mechanical garri dryer.",
    packaging: "Garri can be packaged in sacks, polythene bags or nylon.",
    processingTools: '',
    economicImportance: '',
    uses: '',
  ),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: 'Sweet Potato',
      cropImage: 'assets/crops/sweetpotato.png',
      cropFamily: "Convovulaceae",
      botanicalName: "Ipomea Batatas",
      requiredRainfall: "1000 – 7000mm per annum",
      requiredTemperature: '24 - 28°C',
      soilRequirement: "Needs a fertile sandy loam soil.",
      requiredSoilPH: '5.5 – 6.5',
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "Yes",
      irrigation: "Yes",
      maturityPeriod:
          "3 – 7 months for early variety 4 - 6 months for medium variety Over 6 months for late variety.",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation:
          "Mounds or ridges can be made manually by use of hoe or mechanically by use of tractor coupled implements (disc plough, disc harrow and ridger).",
      plantingMaterials: "Vines",
      plantingMethods:
          "Make holes 6 inches deep and 12 inches apart, bury the vines up to the to leaf level, press the soil down gently but firmly and water well.",
      plantingDate:
          'August – September (rain fed) September – December (irrigation)',
      seedRateYield:
          "Plant at a recommended distance of 25 – 38cm within rows 70 – 90 cm apart to have  a population of 25 – 60 plant stand per ha and an approximate yield of 2 – 2.5 ton/ha.",
      weedControl: "It can be done manually or chemically.",
      staking: 'null',
      fertilizerApplication:
          "N.P.K 15:15:15 to stimulate growth of strong stems. From the second month after planting up to 2weeks before harvest, the plant needs more K (12:12:17) or (14:7:21) in other to create well shaped potatoes.",
      pestControl: "Apply pesticides and insecticides in liquid or powder form",
      pest: "Leaf miner fly, Colorado potato beetle, Potato tuber moth.",
      diseaseControl:
          'Use nematicides and fungicides at early stage to treat crop stands. In severe cases eliminate and burn infested plants. ',
      disease:
          "Late blight, Bacterial wilt, Black heart disorder, Dry rot, Potato Spindle Tuber Viroid (PSTVd), Mosaic disease, Leaf roll, Potato black leg, Potato virus X, S & Y.",
      symptoms:
          "•	Bacterial wilt causes infected plan to wilt, starting from the tips of the leaves or where the stems branch out, and then spreading to all parts of the plant."
          "•	Late blight damages leaves, stems and tubers. Affected leaves appear blistered as if scalded by hot water and eventually rot and dry out."
          "•	Potato black leg is a rot of the lower stem region. This is encouraged by cool, damp conditions"
          "•	Black heart disorder causes blackening of the tuber center follows acute oxygen deficiency associated with either low temperature in confined storage or high field soil temperatures"
          "•	PSTVd causes tubers to become narrow and spindle or oblong in shape, or more rounded than expected for a particular variety, and have prominent eyebrows. Tubers can also become cracked or develop knobs and swellings",
      pestDiseaseControl: "Use pesticides, insecticides and fungicides.",
      harvest:
          "Harvest manually by use of digging sticks to lever the tuber out of the ground. Hoe or digger can be used for same purpose. It can also be harvest mechanically by use of tractor drawn digger.",
      processing:
          "peeling, slicing, and frying to produce potato chips Peeling, slicing, drying and milling to produce potato flour.",
      storage:
          "Potato does not store for a long time as it loses 10 – 15% of its weight by 2weeks after harvest. Though drying is advised before storage to prolong the life shell of the produce.",
      products:
          "Sweet potato flake, buns, cakes, rolls, puff-puff flour, crisps, and canned sweet potato. Can also be used as animal feed, starch, sweet potato beer and sweet potato beverage.",
      processingTools: 'Knives, washing basins, pots, sieves, frying pans etc',
      processingMachines:
          "Automatic potato chips line that performs the following operations; cleaning, peeling, potato cutting, chips blanching, frying, de-oiling, flavoring, and chips packaging.",
      packaging:
          "cartons, sacks, polythene, or nylon bags are used for packaging potato flour and chips.",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Palm fruit",
      cropImage: 'assets/crops/palmfruit.png',
      cropFamily: 'Arecaceae',
      botanicalName: "Elaeis guineensis",
      requiredRainfall: "2500 – 4000mm per annum",
      requiredTemperature: "20 - 32°C",
      soilRequirement: "loamy or alluvial well-drained soil.",
      requiredSoilPH: ": 4 – 8",
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "No",
      irrigation: "Yes (for young plant)",
      maturityPeriod: "From 4years depending on the variety.",
      landPreparation:
          "The plantation soil should be fertilized with well decomposed organic matter and cleaned from weed through the use of crude tools such as hoes and cutlass and also by application of herbicides.",
      tillageOperation:
          "Plantation tilling improves the soil structure this could be done manually by use of hoes or mechanically by use of tractors coupled implements.",
      plantingMaterials: "seed propagation, offshoot propagation.",
      plantingMethods:
          "To get a good yield from cultivation, oil palm trees must be planted at the right density. The plant sprouts are spaced in a triangular pattern with enough spacing for growing. (9m X 9m X 9m) in pits above 60cm3. This planting method allows placing around 145 plants /ha.",
      plantingDate: "June – September",
      seedRateYield:
          "At a spacing of 3m2, 1100 palm trees can be cultivated per ha, to produce 25tons of palm oil per ha.",
      weedControl: "Can be done manually or chemically for young plants.",
      staking: '',
      fertilizerApplication:
          "Ammonium sulphate and potassium chloride from 1st year to 4th year of growing.",
      pestControl:
          "Biological control method is advised. It involves the introduction of predators and parasitoids combined with pheromones and plant based lures (e.g fermented caster cake).",
      diseaseControl:
          'Treat with fungicide and observe plants closely, in most severe cases infested trees should be felled and burned. ',
      pest:
          "Rhinoceros beetle, bag worms, red palm weevils and mealy bug rodents etc.",
      disease:
          "Ganoderma butt rot, bacteria bud rot, pestalotiopsis leaf spots and oil palm wilt etc.",
      symptoms:
          "•	Bacterial bud rot results in buds becoming rotten and putrid, leading to death of the palm tree."
          "•	Ganoderma butt rot reduced growth of palm, causes pale green foliage, older fronds turning chlorotic or necrotic and drooping fronds."
          "•	Pestalotiopsis leaf spots causes tiny black spots on leaves which enlarge into 2 mm long elliptical, elongated lesions."
          "•	Oil palm wilt causes seedlings exhibit retarded growth, reduced leaf size, chlorosis of older leaves and tip necrosis: field palms may exhibit a bright yellow chlorosis of leaves in the mid-canopy which starts at the tip of the pinnae and moves towards petioles before affecting adjacent fronds and spreading to older leaves in the canopy.",
      pestDiseaseControl:
          "Biological control method is advised. It involves the introduction of predators and parasitoids combined with pheromones and plant based lures (e.g fermented caster cake).",
      harvest:
          "This can be done locally by cutting the matured bunch from the tree and allowing it to fall under gravity.",
      processing:
          "this involves the collection of fresh fruit bunches from the plantations, sterilizing and threshing of the bunch to detach the palm fruits. Boiling, mashing and pressing out the crude palm oil. The crude oil is further treated to purify it for storage and export. Kernels are further processed to produce palm kernel oil.",
      storage:
          "Palm oil can be stored in rubber cans, plastic containers, iron drums or bottle. Kernels can be stored in sacks, polythene or nylon.",
      products:
          "palm oil, palm kernel oil, palm kernel cake for animal feed production, palm stew (banga stew), broom, roofing material, timber, soap, detergent, margarine, candle, lubricant, pomades, livestock feed.",
      processingMachines:
          "hammer mill, hydraulic de-oiler, digester, spindle screw press.",
      packaging:
          "Palm oil or palm kernel oil can be packaged in gallons, plastic containers, metal drums, glass bottles or clay pots.",
      processingTools:
          "pots, cutlass, and wooden platforms for matching seeds.",
      economicImportance: '',
      uses: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Fluted Pumpkin (Ugu)",
      cropImage: 'assets/crops/flutedpumpkin.png',
      cropFamily: 'Cucurbitaceae',
      botanicalName: "Telfairia occidentalis",
      requiredRainfall: "A mean annual rainfall in the range of 1900 – 2200mm.",
      requiredTemperature: "21 - 32°C",
      soilRequirement: "well-drained sandy loam soil.",
      requiredSoilPH: "5.9 - 8",
      shadeTolerance: "Yes",
      waterLoggedTolerance: "Yes",
      droughtResistance: "No",
      irrigation: "Yes (for dry season production)",
      maturityPeriod:
          "The vegetable parts mature at about 2months after planting while the fruits (pods) mature at about 6 – 8 months after planting.",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation:
          "Fluted pumpkin can be grown on ridges, mounds, or beds. For easy root penetration and seed germination, beds are recommended. Sunken bed of any convenient width and length are made. If available, well rotted organic manure (10ton/ha) which is approximately 1 head pan per 2m2 is worked into the beds. Mulch beds with dry grass.",
      plantingMaterials: "Dry seeds from matured pods",
      plantingMethods:
          "Dig a hole of 4 – 5cm deep and plant the seed with the tip facing down. Cover the seed with a little sand; be sure the seed is well covered to avoid exposure to the sun.",
      plantingDate:
          "For early planting (rain fed) May/June For dry season production (irrigation) September/October.",
      seedRateYield:
          "At an optimum spacing of 1m2, 10,000 plants can be cultivated per ha with over 40 seeds per pod.",
      weedControl:
          "Weed is controlled by mulching, use of herbicides as well as manual weeding to maintain the pumpkin farm.",
      staking:
          'apart from reducing the incidence of spot on the leaves due to better exposure and ventilation around plants, staking has been shown to give high yield of leaves and enhance pod formation. This should be done 6 – 8weeks after planting by building overhead racks with forked sticks and bamboo poles. The racks can be of any convenient height but not below 1m.',
      fertilizerApplication:
          "a)	For high leaf yield: Basal dress N 60kg/ha, P2O5 60kg/ha and K2O 45kg/ha. Plant dress N 30kg/ha after 3months to boost vegetative growth.  b)	For pod production: Apply N.P.K 15:15:15 400kg/ha after first weeding.  c)	Organic manure (poultry droppings) is also recommended.",
      pestControl:
          "Destroy affected leaves and fruit flies that infest the fruit especially in dry season.",
      diseaseControl:
          'Use Dithane M-45, Benlate and other fungicides to control cercospora spot disease. Use lime-sulphur (1 table spoon in 7beer bottles of water) to control mildews disease.',
      pest: "Grasshopper, leaf beetle, sucking bugs.",
      disease: "Cercospora spot disease and mildews disease.",
      symptoms:
          "Dark spots on leaves as they dry up gradually. In most severe cases leaves dry up speedily and pods shrink.",
      pestDiseaseControl:
          "Destroy affected leaves and fruit flies that infest the fruit especially in dry season. Use Dithane M-45, Benlate and other fungicides to control cercospora spot disease. Use lime-sulphur (1 table spoon in 7beer bottles of water) to control mildews disease.",
      harvest:
          "With adequate water, pumpkin germinates 10days after planting. Farmers can start harvesting 2 – 4weeks after planting or when the stems are long enough. Harvesting can be done manually by hands or use of knives to cut the stem a little distance away from the bottom of the stem. Position your hand where you have the node and cut. The pod is ripe for harvest when the tendrils are dried; sometimes they fall off on their own. With a lot of water and manure, the vegetable would be made in the dry season.",
      processing:
          "Fluted pumpkin is better consumed fresh so no further processing is advices.",
      storage: "Fluted pumpkin can be stored in the fridge for 3 - 5days.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "African Rosewood (Oha/Ora)",
      cropImage: 'assets/crops/africanroastwood.png',
      cropFamily: 'Leguminosae',
      botanicalName: "Pterocarpus mildbraedii",
      requiredRainfall: "Average of 600 – 1200mm per annum",
      requiredTemperature: "15 - 32°C",
      soilRequirement: "Semiarid and sub-humid soils.",
      requiredSoilPH: "4 - 6",
      shadeTolerance: "Yes",
      waterLoggedTolerance: "No",
      droughtResistance: "Yes",
      irrigation: "No",
      maturityPeriod:
          "From 2 years and above for leaf production and 3 – 4 decades for timber production.",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation:
          "Flats can be used for seed propagation in the nursery site.",
      plantingMaterials:
          "Seeds or little branches (sticks) with healthy nodes.",
      plantingMethods:
          "It has a hard seed coat and may benefit from scarification before sowing in order to speed up and improve germination. This can be achieved by pouring a small amount of nearly boiling water on the seeds (being careful not to cook them!) and then soaking them for 12-24 hours in warm water to enable them imbibe water and swell, make a nick in the seed coat (being careful not to damage the embryo) and soak for further 12 hours before sowing.",
      plantingDate: "May -August",
      seedRateYield: "At a spacing of 3m2, 1,100 trees can be produced per ha.",
      weedControl:
          "This is essential for the young plants and can be done manually or mechanically",
      staking: '',
      fertilizerApplication:
          "Organic fertilizer (manure) can be used to improve the performance of young plants.",
      pestControl: "Apply insecticide with sprayer or duster.",
      diseaseControl:
          'Most common control is to cut down infested rose wood trees.',
      pest: "Butterflies, Moths, Beetles, Weevil, Termites etc.",
      disease:
          "Pine needle rust, leaf rust, leaf spot, pine needle blight, tar spot etc.",
      symptoms:
          "Generally, infected trees do not exhibit symptoms until they are at least four to five years old. Leaves become flaccid, turn pale and then yellow and drop off. This is followed by dieback in twigs and branches. The bark peels off and rots, often exposing secondary rots and insect activity. When the rotted bark is chopped off, the infection can be seen as the outer wood turns brown or has brown streaks, in contrast to the white wood with rose resin streaks in healthy trees.",
      pestDiseaseControl:
          "Apply insecticide with sprayer or duster, Most common control is to cut down infested rose wood trees.",
      harvest:
          "For vegetable production; knife can be used to cut the tiny stems bearing the leaves while hands can be used to further separate the fresh leaves from the stem. For timber production; forest machines (chain saw/fell buncher) are used to harvest matured trees.",
      processing:
          "Oha/Ora leaf is better consumed fresh thus no further processing is advised. ",
      storage:
          "African rose wood leaves, just like other vegetables can be stored in the fridge for 3 – 5 days.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      economicImportance: '',
      uses: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Bitter leaf",
      cropImage: 'assets/crops/bitterleaf.png',
      cropFamily: 'Asteracea',
      botanicalName: "Vernonia amygdalina",
      requiredRainfall: "An average of 750 – 2000mm per annum",
      requiredTemperature: "21 - 37°C",
      soilRequirement: "Sandy loam soil rich in organic matter",
      requiredSoilPH: "4 - 8",
      shadeTolerance: "Yes",
      waterLoggedTolerance: "Yes",
      droughtResistance: "Yes",
      irrigation: "Yes for dry season production",
      maturityPeriod: "From 3 months after planting.",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation:
          "Mounds or flats can be adopted for bitter leaf production",
      plantingMaterials:
          "Though seeds can be collected from dry flower heads, bitter leaf is best propagated through cuttings from matured stems with healthy nodes.",
      plantingMethods:
          "Though propagation of bitter leaf plant is possible by seed collection from dry flower heads, stem cuttings are used as they grow faster. Cuttings are selected based on leaf size, bitterness and growth characteristics, it is planted erect or slanted at 450 to obtain more side shoots. Seeds can be sown in nursery beds prepared from humus rich soil shaded from excessive heat or sunlight and watered regularly to germinate fast. Seedlings can be transplanted 4 – 6 weeks after emergence. Commercial farmers prefer to plant new crops at the beginning of the season or after the second year.",
      plantingDate: "March - July",
      seedRateYield:
          "At an optimum spacing of 90 X 40cm, 27,777 bitter leaf stands can be planted per ha.",
      weedControl: "This can be done manually or chemically.",
      staking: '',
      fertilizerApplication:
          "Organic manure is best required for optimum yield of bitter leaf. For fertilizer application 400 – 500kg per ha of N.P.K 20:10:10 can be applied using side placement method.",
      pestControl: "This can be controlled by use of leaf powder insecticide.",
      diseaseControl: 'Farmer is advised to uproot and burn infected plant.',
      pest: "Major pest include bitter leaf weevil and lixus camerunus Kolbe.",
      disease: "Mosaic disease of vernonia",
      symptoms:
          "Leaves turn pale yellow followed by severe wilting on both leaves and stem",
      pestDiseaseControl:
          "Major pest include bitter leaf weevil and lixus camerunus Kolbe. This can be controlled by use of leaf powder insecticide, Mosaic disease of vernonia. Farmer is advised to uproot and burn infected plant.",
      harvest:
          "The shoots and leaves may be harvested for 7years but consistent harvesting will prevent flowering and fruiting. This is done manually by use of a sharp knife. The young leaves are very bitter but tender while the old leaves have less astringency and are best for drying.",
      processing:
          "Harvested bitter leaf can be washed to reduce bitterness and dried to be used after long period as it retains its taste and flavor after being properly dries.",
      storage: "",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Okra",
      cropImage: 'assets/crops/okra.png',
      cropFamily: 'Malvaceae',
      botanicalName: "Abelmoschus esculentus",
      requiredRainfall: "An average of 1000mm",
      requiredTemperature: "Accommodate a wide range of 23.8 - 35°C",
      soilRequirement:
          "Light, well-drained sandy loam soil rich in organic matter",
      requiredSoilPH: "5.8 – 6.8",
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "No",
      irrigation: "Yes (in the north)",
      maturityPeriod: "2 – 3 months",
      landPreparation:
          "Early land clearing is an important step in okra production. Clear debris with cutlass, add compost to field in advance and turn in the composition into the soil. Give them time to decompose before okra is planted. Conduct soil test to check for nematode if there is any trace it is important to fumigate the soil because okra is very susceptible to damage from nematode.",
      tillageOperation:
          "Conventional clean tillage method can be used for okra production which includes deep ploughing, disking and harrowing.",
      plantingMaterials: "Dry okra seeds.",
      plantingMethods:
          "Direct seeding into the soil at a depth of 2 – 3cm. this can be done manually through local means or mechanically with seeders and planters.",
      plantingDate:
          "November – January. Plant at least 3 months before the first rain fall as okra is a heat loving annual crop.",
      seedRateYield:
          "With 2 crops per stand at a spacing of 10cm apart, 2032 crops can be planted per ha giving an average annual yield of 1.6ton per ha with 1 – 4 pods per stand.",
      weedControl:
          "Adopt the use of organic mulches ones soil temperature has increased and crop growth is rapid. Herbicides can also be used to kill weeds. Intercropping with maize and onion also helps to control weeds.",
      staking: '',
      fertilizerApplication:
          "Before planting use 900 – 1,364g of fertilizer such as N.P.K 10:10:10 or 15:5:10 for each 100ft2 of garden area. Spread the fertilizer evenly over the land and then mix it well into the top 3 – 4 inches of the soil. After the first harvest apply 1 cup of garden fertilizer for each 10ft of row.",
      pestControl:
          "They are controlled with insecticides such as malathion and sevin respectively",
      diseaseControl:
          'Treat diseases with dithane M45 or bavistin, karathane powder, copper oxychloride or zineb, dimethoate or metasystox, and monocrotophos respectively.',
      pest: "Aphids and sting buds",
      disease:
          "They include Damping Off Disease, Fusarium Wilt, Powdery Mildew, Cercospora Leaf Spot, Yellow Vein Mosaic Virus (YVMV), Enation Leaf Curl of Bhendi",
      symptoms:
          "Root damage, wilting and yellowing of the plant above ground level, leaves shrivel and die in severe cases.",
      pestDiseaseControl:
          "Pests are controlled with insecticides such as malathion and sevin respectively, Treat diseases with dithane M45 or bavistin, karathane powder, copper oxychloride or zineb, dimethoate or metasystox, and monocrotophos respectively. ",
      harvest:
          "Okra plant will produce large flowers about 2 months after planting. The okra pods will be ready for pick 3 – 4 days later, harvest the pods when they 3 – 4 inches long, pick the okra every 1 – 2 days to optimize yield.",
      processing:
          "Okra that is too matured can be dried, grinded, pounded and consumed. Drying prolongs shelf life of the okra plant, Okra seed is easily saved for next season by leaving some of the last pods on the plant until they get very large, remove them and allow them to dry the seed will shell easily from the pod.",
      storage:
          "Fresh okra produce can be stored for 5 – 7 days in the refrigerator.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Garden egg",
      cropImage: 'assets/crops/gardenegg.png',
      cropFamily: 'Solanaceae',
      botanicalName: "Solanum melongena",
      requiredRainfall: "800 – 1200mm",
      requiredTemperature: "21 - 32°C",
      soilRequirement:
          "Performs better in well-drained soils with high organic matter content. Site should be close to a reliable source of water supply for irrigation.",
      requiredSoilPH: "3.5 - 5",
      shadeTolerance: "Yes",
      waterLoggedTolerance: "Yes",
      droughtResistance: "No",
      irrigation: "Yes",
      maturityPeriod: "2 – 3 months after transplanting",
      landPreparation:
          "This is essential for enhanced growth and weed control in garden egg production. Farmers are advised to apply 30tons/ha of decomposed farm-yard manure to the soil before tillage not less than a fortnight earlier than planting.",
      tillageOperation:
          "Little mounds or ridges should be made manually by use of hoe or mechanically by use of tractor coupled implements.",
      plantingMaterials: "Garden egg seeds.",
      plantingMethods:
          "Garden egg seeds are nursed in a tray or seedbed. Then prick out seedlings in seed trays into bigger bins at 2 leaf stage and transplant to the sphere at 5 leaf stage.",
      plantingDate: "April - May (preferably when rainfall becomes steady).",
      seedRateYield:
          "Plant at a spacing of 90cm2 in the moist season and 90cm X 60cm within the minor season. A quantity of 350 – 500g of seed per ha is advised. Depending on the variety and management practices used, a yield of 15 – 40tons/ha can be obtained.",
      weedControl: "Hoeing and mulching should be used to control weed.",
      staking: '',
      fertilizerApplication:
          "Apply N.P.K 15:15:15 250 – 400kg/ha (32g/plant) at 4 weeks interval after planting and after every harvest apply 5g/plant of potassium nitrate (400g/ha).",
      pestControl: "Routine spray of recommended insecticides.",
      diseaseControl:
          'Farmers are advised to practice crop rotation, eliminate diseased plants, make use of resistive cultivars and apply recommended pesticides.',
      pest:
          "Fruit borer, pyralid moth larva, eggplant skeletonizer and spider mites are the major pests of garden egg.",
      disease: "Bacteria wilt and fruit rot disease.",
      symptoms:
          "Dark streaking on the upper branches of the plant, followed by the rapid collapse of the plant and death.",
      pestDiseaseControl:
          "Routine spray of recommended insecticides, Farmers are advised to practice crop rotation, eliminate diseased plants, make use of resistive cultivars and apply recommended pesticides.",
      harvest:
          "Fruits should be harvested twice weekly while they are young. They must have shiny skin and attractive color. Meanwhile during harvest, ensure to cut the fruit from the branches with about 5cm stalk and calyx attached. Young leaves can also be harvested with a knife and eaten fresh or used as vegetable for preparing dishes.",
      processing: "",
      storage:
          "For fresh consumption it can be stored in the refrigerator for 3 to 5days. Shelf life can be prolonged by letting it dry thoroughly and storing in sack or polythene.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Black beans (Akidi)",
      cropImage: 'assets/crops/blackbeans.png',
      cropFamily: 'Fabaceae',
      botanicalName: "Vigna unguiculata",
      requiredRainfall: "1000 – 1200mm per annum",
      requiredTemperature: "27 - 32°C",
      soilRequirement: "loose, well-drained soil",
      requiredSoilPH: "3.5 - 5",
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "Yes",
      irrigation: "No",
      maturityPeriod: "60 – 100days after planting",
      landPreparation:
          "Black bean is a nitrogen fixing crop like other legumes and as such much work may not be needed at the land preparatory stage of production. However, farmers are advised to clear debris and use any legume inoculants (bacteria used to feed the soil and kick start nitrogen production) when planting to boost the beans growth. Do not plant your black bean in the same plot where other legumes have grown within the last few years.",
      tillageOperation:
          "conventional tillage can e adopted for commercial production while hoes can be used to make ridges for small farm holdings. Zero or No tillage system can also be adopted.",
      plantingMaterials: "Dried black bean seeds",
      plantingMethods:
          "Soak your seed in cool clean water overnight before proceeding to plant them. Dig holes about 1inch deep and 6inches apart and plant the beans with their eyes facing downward. Ensure regular watering until the first sprouts show.",
      plantingDate: "March - September",
      seedRateYield:
          "plant 2seeds per hole at a distance of 5inches along rows of 15inches apart to obtain a yield of 2.5ton/ha.",
      weedControl:
          "Weeds should be pulled out manually as black bean plants are rigorous but are susceptible to aggressive weeds.",
      staking: '',
      fertilizerApplication:
          "With the right soil no fertilizer is required. In case of an unfertile soil, organic manure is required.",
      pestControl:
          "Insecticide should be used to manage insect pests, slugs should be handpicked and eliminated.",
      diseaseControl:
          'Ensure proper spacing of crops for improved air circulation to control White mold, practice crop rotation to control Blight.',
      pest: "Bean leaf beetles, cut worms, and slugs.",
      disease: "White mold, Blight",
      symptoms:
          "•Alternaria leaf spot causes small irregular brown lesions on leaves which expand and turn gray-brown or dark brown with concentric zones; older areas of lesions may dry out and drop from leaves causing shot hole; lesions coalesce to form large necrotic patches. "
          "•	Anthracnose causes small dark brown to black lesions on cotyledons with oval or eye-shaped lesions on stems which turn sunken and brown with purple to red margins. Stems may break if cankers weaken stem; pods drying and shrinking may also occur."
          "•	Black root rot causes elongated red-purple lesions on root tissue which turns dark gray to black. Deep lesions can cause stunted growth, wilting leaves, defoliation and plant death."
          "•	In the case of bean rust, initially the symptoms appear as small yellow/white spots on leaves. Later the spots become enlarged and shows raised brick red rust pustules (uredinia).",
      pestDiseaseControl:
          "Insecticide should be used to manage insect pests, slugs should be handpicked and eliminated, Ensure proper spacing of crops for improved air circulation to control White mold, practice crop rotation to control Blight.",
      harvest:
          "For fresh production, the fresh green pods are picked every 72hours as they continue to reproduce. For dry black bean production, the plants are ready for harvest when some of the pods are brown and dry and some still straw yellow in colour, farmers area advised not to wait until all the pods are completely dry on the plant.",
      processing:
          "The dry pods are opened manually as the dry beans therein are separated (collected).",
      storage:
          "Fresh black bean produce can be stored in the refrigerator for 2 -3days after which consumption is advised to avoid wastage due to deterioration. The dried beans can be stored in sacks, polythene bags, bottles or cans for a longer period.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Wild mango (Ogbono)",
      cropImage: 'assets/crops/wildmango.png',
      cropFamily: 'Irvingiaceae',
      botanicalName: "Irvingia gabonensis",
      requiredRainfall: "1200 – 1500mm per annum",
      requiredTemperature: "20 - 37°C",
      soilRequirement: "Sandy loam soil rich in organic matter",
      requiredSoilPH: "4 - 6",
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "Yes",
      irrigation: "Yes (in the nursery)",
      maturityPeriod:
          "Flowering starts from 3yea rs while maturity is 6years and above",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation:
          "Conventional tillage system is advised for commercial production of wild mango. For small farm holdings, hoes can be used to till the soil and prepare it for planting.",
      plantingMaterials:
          "Sexually by Seeds or asexually through grafting, marcoting, cutting, air layering and budding.",
      plantingMethods:
          "For propagation through seed, farmers are advised to soak the seed in water for a day after drying under ambient temperature. This method guarantees effective germination and maturity of the tress may not take up to 10years. However grafting will survive and produce within 3years.",
      plantingDate: "March - May",
      seedRateYield:
          "Wild mango seeds are planted at a spacing of 9m X 9m to produce124trees/ha. The mean fruit yield per tree is 620 and 850 fruits in traditional agro-forestry and compound farms respectively. Similarly, the projected mean fruit yield/ha of both systems were 76,880 and 105,400 fruits respectively.",
      weedControl:
          "This can be done locally through manual means or chemically by the use of herbicides at the early stage of plant growth.",
      staking: '',
      fertilizerApplication:
          "Organic manure is advised at early stage of plant growth.",
      pestControl: "Traps are used to control rodent attack. ",
      diseaseControl: "Treat with fungicide. ",
      pest:
          "The unripe fruits are attacked by rodents, including squirrels which gnaw through the mesocap and the pyrene to reach the seed. Red forest pigs split the pyrenes open and eat the seeds therein.",
      disease: "Brownish-black rot postharvest disease.",
      symptoms: "Seed decay.",
      pestDiseaseControl:
          "Traps are used to control rodent attack, Treat with fungicide.",
      harvest:
          "Wild mango flowers from March – June and has 2 fruiting seasons; April – July and September – October. The fruit is greenish when ripe with a bright orange pulp. It can be harvested by plucking the fruits manually by hand or the use go-to-hell.",
      processing:
          "Use nut cutter to cut the shell and collect seeds easily and faster without injuries.",
      storage:
          "Wild mango nuts are expected to be properly dried before storage in sacks, cans or bottles.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses:
          'a) It has numerous health benefits and so it is been used locally to maintain a sound health condition. b) The oil can be used for production of soap or cosmetics. c) Their wood is very hard and can be used for timber production. d)	The pulp is used in production of black dye. e) Wild mango is mostly used for soup preparation more than other drawing soup.',
      economicImportance:
          'a) It is highly profitable as the seeds are sold at a high price in the market; higher than any other soup cooking produce. b) The demand is high; meaning the business is lucrative. c)	Wild mango farming business is sustainable.'),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "African Star Apple (Udala)",
      cropImage: 'assets/crops/africanstarapple.png',
      cropFamily: 'Sapotaceae',
      botanicalName: "Crysohpyllum albidum",
      requiredRainfall: "1100 – 1300mm per annum",
      requiredTemperature: "mean annual temperature of 27 – 30°C",
      soilRequirement: "well-drained sandy loam soil rich in organic matter.",
      requiredSoilPH: "3.7 - 4",
      shadeTolerance: "No",
      waterLoggedTolerance: "No",
      droughtResistance: "Yes (when mature)",
      irrigation: "Yes (at early stage)",
      maturityPeriod: "15years. Dwarf variety matures within 3years.",
      landPreparation:
          "This can be done manually by use of hoes, cutlasses, axes, rakes and bush burning or mechanically by use of tractor coupled implements such as mowers and rakes. Chemically, herbicides can be used to eradicate bushes from the farm land.",
      tillageOperation: "Hoe can be used to make little mounds.",
      plantingMaterials: "African star apple Seeds.",
      plantingMethods:
          "Use fresh seeds not more than 4months old. The seeds have epigeal germination meaning the seedlings grow above the ground. Water the seed regularly to help speed up germination. For dry season, drip irrigation is advised, mulching can also be done to help retain moisture. Like other economic trees udara plantation can be intercropped. Plant tress you can harvest within a year. After 3years plant crops that can withstand shade eg. Turmeric, ginger etc.",
      plantingDate: "April – May (preferably at the beginning of rainy season)",
      seedRateYield:
          "Like other fruit trees plant udara at a spacing of 9 X 9m. A tree can yield over 1000 fruits for many years. Each fruit contains not more than 5seeds.",
      weedControl:
          "This is important at early stage of plant growth. It can be done manually or chemically.",
      staking: '',
      fertilizerApplication:
          "Apply organic fertilizer before and after germination. N.P.K 15:15:15 can also be introduced. ",
      pestControl:
          "Adopt good cultural practices that allows for adequate air circulation.",
      diseaseControl:
          "Treat harvested fruits with fungicide. Consume shortly after harvest to avoid deterioration as C. albidum begins to deteriorate from 3rd day after harvest.",
      pest: "Flies, scale insects (coccus hesparidum).",
      disease:
          "Fruit rot fungi diseases such as; A. niger, A. flavus, Penicillium sp., Fussarium sp., R. stolonifer, A. tamari, Trichoderma sp., B. theobromae.",
      symptoms: "Fruits turn brown and rot afterwards.",
      pestDiseaseControl:
          "Adopt good cultural practices that allows for adequate air circulation, Treat harvested fruits with fungicide. Consume shortly after harvest to avoid deterioration as C. albidum begins to deteriorate from 3rd day after harvest.",
      harvest:
          "Udara is mostly harvested around December but the taste is not always palatable unlike when it is allowed to stay for rain to meet it before harvesting. Harvest the fruits when the colour turns yellow from green. Some will naturally fall to the ground when ripe. If not harvested quickly, some of the fruits will split on their own. Pluck the fruit with your hand or use a go-to-hell to cut off the bunch of udara stick.",
      processing:
          "a) Udara is now fermented into wine and also distilled into spirits. b) The seeds are extracted for soap making. c) Latex is tapped from the trunk and used for rubber production. d) The white hard wood has high quality and is very valuable in the international market. It is used in construction industry and in the manufacturing of agricultural crude tools handle.",
      storage:
          "Udara deteriorates easily so long term storage of fruit is not advised. However, seeds can be dried and stored in cans or sacks for replanting.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
  AgronomicsPractices(
      riskAssessment: () {},
      cropName: "Maize",
      cropImage: 'assets/crops/maize.png',
      cropFamily: 'Poaceae',
      botanicalName: "Zea mays L.",
      requiredRainfall: "600 – 1500mm per annum",
      requiredTemperature: "Mean temperature of 260 - 30°C",
      soilRequirement: "Well-drained sandy loam soil",
      requiredSoilPH: "5.5 - 8",
      shadeTolerance: "Yes",
      waterLoggedTolerance: "Yes",
      droughtResistance: "Yes (but not at flowering and grain filling periods)",
      irrigation: "Yes (for dry season production)",
      maturityPeriod: "90 – 120 days",
      landPreparation:
          "Adopt any method that can adequately remove weeds and keep the soil loose for good seed germination. As much as possible, incorporate residue of the previous crop into the soil. For large scale farming, clearing method should ensure preservation of the topsoil when uprooting and clearing trees mechanically. Plant immediately after land clearing to allow maize get ahead of weeds. When the land is ploughed mechanically, the depth of planting should not be more than 5cm (2inches).",
      tillageOperation:
          "This can be done with hoes for small scale farming and tractor coupled implements such as disc plough, disc harrow and ridger for large scale farming.",
      plantingMaterials: "Dried maize seeds.",
      plantingMethods:
          "The dry maize seeds can be soaked in water a day before planting to enable them germinate faster as their dormancy is easily broken. Plant at a depth of 2-3cm with 2 – 3 seeds per hole.",
      plantingDate:
          "a).	Early season: Mid March – early April (planting could be done as soon as rainfall becomes steady). b).	Late season: Early August – mid August (popcorn).",
      seedRateYield:
          "a).	25kg/ha for open pollinated varieties, b). 15kg/ha for hybrids, c).	15kg/ha for popcorn. After planting with the above seed rate, the following population and yield is expected. 1.	Open-pollinated / popcorn varieties: Hand planted, 90cm X 40cm, 2plants/stand is expected to give 55,555 plants/ha. 2.	Hybrids: Hand planted, 90cm X 40cm, 2plants/stand is expected to give 55,555 plants/ha. 3.	Mechanical planting (Any variety): 75cm X 25cm, 1plant/stand to give 53,555 plants/ha or 90cm X 20cm, 1plant/stand to give 55,555plants/ha. There should be no thinning or supply except in severe cases. An estimated yield of 3 – 5tonnes/ha is expected.",
      weedControl:
          "Weeds affect maize yield by 40% and as such should be eliminated as soon as they appear on the farm through manual, mechanical or chemical means depending on the size of farm land. The operation should be done 14 – 21days and 57days after planting. Weeds can also be controlled through tillage, planting of weed-free seeds and adopting of cultural methods such as the use of cover crops and planting immediately after land clearing.",
      staking:
          'Removal of excess shoots and replanting of seeds to compensate for loss seedlings should be done immediately after first weeding operation.',
      fertilizerApplication:
          "For a poor soil, apply NPK 15:15:15 and Urea at a ratio of 3:1. That is; 3bags of NPK (150kg) and 1bag of Urea (50kg). Use side placement method ensuring that proper weeding and thinning has been done. Second dose should be applied after third weeding. The use of organic manure such as animal dung and poultry dropping is highly encouraged.",
      pestControl:
          "The above pests can be controlled through the following means; Monocrotophos (eg Azodrin, Nuvacron and Ultracide) to control army-worms and grasshoppers, Destroy termite hills and apply Nogos50 to control termites, Furadan 3G or 10G and Vetox85 to control stem borers, Cymbush 10EC and Ambush 25EC for corn ear worms.",
      diseaseControl:
          "1.	Bacterial stalk rot: Use of disease resistance varieties such as hybrids, Ganga safed-2, DHM103. Avoid water logging and poor drainage."
          " 2.	Black bundle disease and late wilt: Use resistant variety like Ganga safed-2, practice crop sanitation and crop rotation, avoid water stress at flowering, treat seeds with Thiram or Captan 3g/kg of seed."
          "3.	Charcoal rot: Practice regular irrigation especially during flowering time, avoid susceptible varieties like DHM105 and treat seeds with Carbendazin or Thiram 3g/kg of seeds, practice field sanitation and crop rotation."
          "4.	Common rot: Plant hybrids like Deccan, Ganga-5, Deccan Hybrid Makka-103 and DHM-1; also spray Mancozeb 2.5g/l or Dithane M-45 repeatedly at 10 days interval."
          "5.	Downy mildews: Eradicate collateral and wild hosts near maize field and eliminate infected maize plants, destroy plant debris by deep ploughing, treat seeds with Metalaxyl at 4g/kg and foliar spray of Mancozeb 2.5g/l or Metalaxyl MZ at 2g/l, adopt the use of resistant varieties like DMR1, DMR5 and Ganga11.",
      pest:
          "Army-worms and grasshoppers, Termites, Stem-borers, Corn ear worms.",
      disease:
          "Bacterial stalk rot, Black bundle disease and late wilt, Charcoal rot, Common rot, Downy mildews.",
      symptoms:
          "•	Small oval or elongated water-soaked spots which enlarge up to 15 mm long appear on leaves."
          "•	Lesions develop a tan center and red-brown or orange border."
          "•	Lesions may coalesce to form large necrotic (dead) patches."
          "•	Severely infected leaves on susceptible hybrids may wither and die.",
      pestDiseaseControl:
          "The above pests can be controlled through the following means; Monocrotophos (eg Azodrin, Nuvacron and Ultracide) to control army-worms and grasshoppers, Destroy termite hills and apply Nogos50 to control termites, Furadan 3G or 10G and Vetox85 to control stem borers, Cymbush 10EC and Ambush 25EC for corn ear worms. 1.	Bacterial stalk rot: Use of disease resistance varieties such as hybrids, Ganga safed-2, DHM103. Avoid water logging and poor drainage. 2.	Black bundle disease and late wilt: Use resistant variety like Ganga safed-2, practice crop sanitation and crop rotation, avoid water stress at flowering, treat seeds with Thiram or Captan 3g/kg of seed. 3.	Charcoal rot: Practice regular irrigation especially during flowering time, avoid susceptible varieties like DHM105 and treat seeds with Carbendazin or Thiram 3g/kg of seeds, practice field sanitation and crop rotation. 4.	Common rot: Plant hybrids like Deccan, Ganga-5, Deccan Hybrid Makka-103 and DHM-1; also spray Mancozeb 2.5g/l or Dithane M-45 repeatedly at 10 days interval. 5.	Downy mildews: Eradicate collateral and wild hosts near maize field and eliminate infected maize plants, destroy plant debris by deep ploughing, treat seeds with Metalaxyl at 4g/kg and foliar spray of Mancozeb 2.5g/l or Metalaxyl MZ at 2g/l, adopt the use of resistant varieties like DMR1, DMR5 and Ganga11.",
      harvest:
          "This can be done in 75 – 90days after planting for fresh maize production. When the hair on the cob starts drying up or shrinking know that the maize is ready for harvest. For dry maize production harvest at around 120-150days. Harvest the maize when it is fully dried in other to avoid losses due to mycotoxins growth during storage.",
      processing:
          "a) Drying of maize grains to improve shelf life b) Shelling to separate the grains from the cobs, c) Winnowing/cleaning, d).	Sorting/grading and packaging, e).	Milling into powder form to produce maize flour, f).	Milling with other condiments to produce animal (poultry) feed, g) Grinding, sieving and boiling into corn porridge (agidi), h) Can be fermented into local beer (burukutu), i) Can be cooked, milled, rolled and baked into flakes and crunches.",
      storage:
          "Fresh harvested maize should be consumed or processed immediately to avoid loss of taste, flavor and other qualities. The late harvested (dry) maize can be stored in cribs after further proper drying. Maize grains can also be stored in sacks, cans, bottles, cribs or silos after proper drying. Maize grains can also be stored on the cob without shelling with or without the husk by drying and hanging it over fire places.",
      products: "",
      processingMachines: "",
      packaging: "",
      processingTools: "",
      uses: '',
      economicImportance: ''),
];
