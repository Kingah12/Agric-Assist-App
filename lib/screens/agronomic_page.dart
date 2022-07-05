import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgronomicsPage extends StatefulWidget {
  final String image;
  final String cropName;
  final String cropFamily;
  final String botanicalName;
  final String requiredRainfall;
  final String requiredTemp;
  final String soilRequirement;
  final String soilPh;
  final String shadeTol;
  final String waterLogTol;
  final String droughtRes;
  final String irrigation;
  final String maturityPeriod;
  final String landPreparation;
  final String tillageOperation;
  final String plantingMaterials;
  final String plantingMethods;
  final String plantingDate;
  final String seedRateY;
  final String weedControl;
  final String fertilizerApplication;
  final String diseaseSymptoms;
  final String pest;
  final String pestControl;
  final String harvest;
  final String processing;
  final String storage;
  final String products;
  final String processingMachine;
  final String packaging;
  const AgronomicsPage({
    Key? key,
    required this.image,
    required this.cropName,
    required this.cropFamily,
    required this.botanicalName,
    required this.requiredRainfall,
    required this.requiredTemp,
    required this.soilRequirement,
    required this.soilPh,
    required this.shadeTol,
    required this.waterLogTol,
    required this.droughtRes,
    required this.irrigation,
    required this.maturityPeriod,
    required this.landPreparation,
    required this.tillageOperation,
    required this.plantingMaterials,
    required this.plantingMethods,
    required this.plantingDate,
    required this.seedRateY,
    required this.weedControl,
    required this.fertilizerApplication,
    required this.diseaseSymptoms,
    required this.pest,
    required this.pestControl,
    required this.harvest,
    required this.processing,
    required this.storage,
    required this.products,
    required this.processingMachine,
    required this.packaging,
  }) : super(key: key);
  @override
  State<AgronomicsPage> createState() => _AgronomicsPageState();
}

class _AgronomicsPageState extends State<AgronomicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
                          'Details',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.green,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PhysicalModel(
                    color: Colors.white,
                    shadowColor: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 20,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.image),
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              rowText(text: widget.cropName, nameText: "Name"),
                              rowText(
                                  text: widget.cropFamily, nameText: 'Family'),
                              rowText(
                                  text: widget.botanicalName,
                                  nameText: "Botanical name"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                    child: PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.green,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 700,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Crop Requirement',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ),

                              ///first
                              underLinedText('Required Rainfall'),
                              contextText(widget.requiredRainfall),

                              //second
                              const SizedBox(height: 12),
                              underLinedText('Required Temperature'),
                              contextText(widget.requiredTemp),

                              //third
                              const SizedBox(height: 12),
                              underLinedText('Soil Requirement'),
                              contextText(widget.soilRequirement),

                              //forth
                              const SizedBox(height: 12),
                              underLinedText('Required Soil PH'),
                              contextText(widget.soilPh),

                              //fifth
                              const SizedBox(height: 12),
                              underLinedText('Shade Tolerance'),
                              contextText(widget.shadeTol),

                              //fifth
                              const SizedBox(height: 12),
                              underLinedText('Water Logged Tolerance'),
                              contextText(widget.waterLogTol),

                              //sixth
                              const SizedBox(height: 12),
                              underLinedText('Drought Resistance'),
                              contextText(widget.droughtRes),

                              //seven
                              const SizedBox(height: 12),
                              underLinedText('Irrigation'),
                              contextText(widget.irrigation),

                              //eight
                              const SizedBox(height: 12),
                              underLinedText('maturityPeriod'),
                              contextText(widget.maturityPeriod),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                    child: PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.green,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 500,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Pre – Planting Operations',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ),

                              ///first
                              underLinedText('Land preparation'),
                              contextText(widget.landPreparation),

                              //second
                              const SizedBox(height: 12),
                              underLinedText('Tillage operation'),
                              contextText(widget.tillageOperation),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                    child: PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.green,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 1700,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Planting Operations',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ),

                              ///first
                              underLinedText('Planting Materials'),
                              contextText(widget.plantingMaterials),

                              //second
                              const SizedBox(height: 12),
                              underLinedText('Planting methods'),
                              contextText(widget.plantingMethods),

                              //third
                              const SizedBox(height: 12),
                              underLinedText('Planting Dates'),
                              contextText(widget.plantingDate),

                              //forth
                              const SizedBox(height: 12),
                              underLinedText('Seed Rate/yield'),
                              contextText(widget.seedRateY),

                              //fifth
                              const SizedBox(height: 12),
                              underLinedText('Weed Control'),
                              contextText(widget.weedControl),

                              //fifth
                              const SizedBox(height: 12),
                              underLinedText('Fertilizer Application'),
                              contextText(widget.fertilizerApplication),

                              //sixth
                              const SizedBox(height: 12),
                              underLinedText('Disease and Symptoms'),
                              contextText(widget.diseaseSymptoms),

                              //seven
                              const SizedBox(height: 12),
                              underLinedText('Pest'),
                              contextText(widget.pest),

                              //eight
                              const SizedBox(height: 12),
                              underLinedText('Pest and Disease Control'),
                              contextText(widget.pestControl),

                              //nine
                              const SizedBox(height: 12),
                              underLinedText('Harvest'),
                              contextText(widget.harvest),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                    child: PhysicalModel(
                        color: Colors.white,
                        shadowColor: Colors.green,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 800,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Post Harvest Operations',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ),

                              ///first
                              underLinedText('Processing'),
                              contextText(widget.processing),

                              //second
                              const SizedBox(height: 12),
                              underLinedText('Storage'),
                              contextText(widget.storage),

                              //third
                              const SizedBox(height: 12),
                              underLinedText('Products'),
                              contextText(widget.products),

                              //forth
                              const SizedBox(height: 12),
                              underLinedText('Processing Machine'),
                              contextText(widget.processingMachine),

                              //fifth
                              const SizedBox(height: 12),
                              underLinedText('Packaging'),
                              contextText(widget.packaging),
                            ],
                          ),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget underLinedText(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        title,
        style: const TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 16,
            fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget contextText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 5, right: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget rowText({required String text, required String nameText}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            '${nameText}:',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
