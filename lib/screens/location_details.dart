import 'package:agro_assist/screens/agronomic_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/agronomics_practices/agronomics_practices.dart';

var agronomics = agroPractices;
int _index = 1;

class LocationDetails extends StatefulWidget {
  const LocationDetails({Key? key}) : super(key: key);

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, bottom: 10),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                color: Colors.black, size: 20)),
                      ),
                      const SizedBox(width: 70),
                      const Center(
                        child: Text(
                          'Agro',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Center(
                        child: Text(
                          'Crops',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.green,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 14, bottom: 2),
                    child: Text(
                      'Please select available crop items',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: agronomics.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: cropItem(
                            agronomics[index].cropImage,
                            agronomics[index].cropName,
                            agronomics[index].cropFamily,
                            agronomics[index].botanicalName,
                            agronomics[index].requiredRainfall,
                            agronomics[index].requiredTemperature,
                            agronomics[index].soilRequirement,
                            agronomics[index].requiredSoilPH,
                            agronomics[index].shadeTolerance,
                            agronomics[index].waterLoggedTolerance,
                            agronomics[index].droughtResistance,
                            agronomics[index].irrigation,
                            agronomics[index].maturityPeriod,
                            agronomics[index].landPreparation,
                            agronomics[index].tillageOperation,
                            agronomics[index].plantingMaterials,
                            agronomics[index].plantingMethods,
                            agronomics[index].plantingDate,
                            agronomics[index].seedRateYield,
                            agronomics[index].weedControl,
                            agronomics[index].fertilizerApplication,
                            agronomics[index].diseaseAndSymptoms,
                            agronomics[index].pestInclude,
                            agronomics[index].disease,
                            agronomics[index].harvest,
                            agronomics[index].processing,
                            agronomics[index].storage,
                            agronomics[index].products,
                            agronomics[index].processingMachines,
                            agronomics[index].packaging,
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cropItem(
    String cropImage,
    String cropName,
    String cropFamily,
    String botanicalName,
    String requiredRainfall,
    String requiredTemp,
    String soilRequirement,
    String soilPh,
    String shadeTol,
    String waterLogTol,
    String droughtRes,
    String irrigation,
    String maturityPeriod,
    String landPreparation,
    String tillageOperation,
    String plantingMaterials,
    String plantingMethods,
    String plantingDate,
    String seedRateY,
    String weedControl,
    String fertilizerApplication,
    String diseaseSymptoms,
    String pest,
    String pestControl,
    String harvest,
    String processing,
    String storage,
    String products,
    String processingMachine,
    String packaging,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AgronomicsPage(
            image: cropImage,
            cropName: cropName,
            cropFamily: cropFamily,
            botanicalName: botanicalName,
            requiredRainfall: requiredRainfall,
            requiredTemp: requiredTemp,
            soilRequirement: soilRequirement,
            soilPh: soilPh,
            shadeTol: shadeTol,
            waterLogTol: waterLogTol,
            droughtRes: droughtRes,
            irrigation: irrigation,
            maturityPeriod: maturityPeriod,
            landPreparation: landPreparation,
            tillageOperation: tillageOperation,
            plantingMaterials: plantingMaterials,
            plantingMethods: plantingMethods,
            plantingDate: plantingDate,
            seedRateY: seedRateY,
            weedControl: weedControl,
            fertilizerApplication: fertilizerApplication,
            diseaseSymptoms: diseaseSymptoms,
            pest: pest,
            pestControl: pestControl,
            harvest: harvest,
            processing: processing,
            storage: storage,
            products: products,
            processingMachine: processingMachine,
            packaging: packaging,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.green, width: 1),
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: AssetImage(cropImage),
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    cropName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
