import 'package:agro_assist/screens/agronomic_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/agronomics_practices/agronomics_practices.dart';

var agronomics = agroPractices;
int _index = 1;

class LocationDetails extends StatefulWidget {
  final int rainfall;
  const LocationDetails({Key? key, required this.rainfall}) : super(key: key);

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
                            cropImage: agronomics[index].cropImage,
                            cropName: agronomics[index].cropName,
                            cropFamily: agronomics[index].cropFamily,
                            botanicalName: agronomics[index].botanicalName,
                            requiredRainfall:
                                agronomics[index].requiredRainfall,
                            requiredTemp: agronomics[index].requiredTemperature,
                            soilRequirement: agronomics[index].soilRequirement,
                            soilPh: agronomics[index].requiredSoilPH,
                            shadeTol: agronomics[index].shadeTolerance,
                            waterLogTol: agronomics[index].waterLoggedTolerance,
                            droughtRes: agronomics[index].droughtResistance,
                            irrigation: agronomics[index].irrigation,
                            maturityPeriod: agronomics[index].maturityPeriod,
                            landPreparation: agronomics[index].landPreparation,
                            tillageOperation:
                                agronomics[index].tillageOperation,
                            plantingMaterials:
                                agronomics[index].plantingMaterials,
                            plantingMethods: agronomics[index].plantingMethods,
                            plantingDate: agronomics[index].plantingDate,
                            seedRateY: agronomics[index].seedRateYield,
                            weedControl: agronomics[index].weedControl,
                            fertilizerApplication:
                                agronomics[index].fertilizerApplication,
                            pest: agronomics[index].pest,
                            harvest: agronomics[index].harvest,
                            processing: agronomics[index].processing,
                            storage: agronomics[index].storage,
                            products: agronomics[index].products,
                            processingMachine:
                                agronomics[index].processingMachines,
                            packaging: agronomics[index].packaging,
                            symptoms: agronomics[index].symptoms,
                            pestControl: agronomics[index].pestControl,
                            diseaseControl: agronomics[index].diseaseControl,
                            disease: agronomics[index].disease,
                            rainfall: widget.rainfall,
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

  Widget cropItem({
    required String cropImage,
    required String cropName,
    required String cropFamily,
    required String botanicalName,
    required String requiredRainfall,
    required String requiredTemp,
    required String soilRequirement,
    required String soilPh,
    required String shadeTol,
    required String waterLogTol,
    required String droughtRes,
    required String irrigation,
    required String maturityPeriod,
    required String landPreparation,
    required String tillageOperation,
    required String plantingMaterials,
    required String plantingMethods,
    required String plantingDate,
    required String seedRateY,
    required String weedControl,
    required String fertilizerApplication,
    required String pest,
    required String pestControl,
    required String harvest,
    required String processing,
    required String storage,
    required String products,
    required String processingMachine,
    required String packaging,
    required String symptoms,
    required String diseaseControl,
    required String disease,
    required int rainfall,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AgronomicsPage(
            rainfall: rainfall,
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
            pest: pest,
            pestControl: pestControl,
            harvest: harvest,
            processing: processing,
            storage: storage,
            products: products,
            processingMachine: processingMachine,
            packaging: packaging,
            symptoms: symptoms,
            diseaseControl: diseaseControl,
            disease: disease,
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
