import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AgronomicsPage extends StatefulWidget {
  final int rainfall;
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
  final String pest;
  final String pestControl;
  final String harvest;
  final String processing;
  final String storage;
  final String disease;
  final String products;
  final String processingMachine;
  final String packaging;
  final String symptoms;
  final String diseaseControl;

  const AgronomicsPage({
    Key? key,
    required this.rainfall,
    required this.image,
    required this.cropName,
    required this.diseaseControl,
    required this.cropFamily,
    required this.botanicalName,
    required this.requiredRainfall,
    required this.requiredTemp,
    required this.soilRequirement,
    required this.soilPh,
    required this.shadeTol,
    required this.waterLogTol,
    required this.droughtRes,
    required this.disease,
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
    required this.pest,
    required this.pestControl,
    required this.harvest,
    required this.processing,
    required this.storage,
    required this.products,
    required this.processingMachine,
    required this.packaging,
    required this.symptoms,
  }) : super(key: key);
  @override
  State<AgronomicsPage> createState() => _AgronomicsPageState();
}

class _AgronomicsPageState extends State<AgronomicsPage> {
  double low = 290;
  double medium = 300;
  double high = 350;

  checkRiskAssessment() {
    if (widget.cropName == 'Yam') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 650;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Coco Yam') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 650;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Cassava') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 650;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Sweet Potato') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 700;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Palm fruit') {
      if (widget.rainfall >= 899.9) {
        setState(() {
          low = 900;
        });
      } else if (widget.rainfall >= 800 || widget.rainfall < 899.9) {
        setState(() {
          medium = 850;
        });
      } else if (widget.rainfall < 700) {
        setState(() {
          high = 700;
        });
      }
    } else if (widget.cropName == 'Fluted Pumpkin (Ugu)') {
      if (widget.rainfall >= 899.9) {
        setState(() {
          low = 900;
        });
      } else if (widget.rainfall >= 800 || widget.rainfall < 899.9) {
        setState(() {
          medium = 850;
        });
      } else if (widget.rainfall < 700) {
        setState(() {
          high = 700;
        });
      }
    } else if (widget.cropName == 'African Rosewood (Oha/Ora)') {
      if (widget.rainfall >= 599.9) {
        setState(() {
          low = 600;
        });
      } else if (widget.rainfall >= 400 || widget.rainfall < 599.9) {
        setState(() {
          medium = 500;
        });
      } else if (widget.rainfall < 400) {
        setState(() {
          high = 400;
        });
      }
    } else if (widget.cropName == 'Bitter leaf') {
      if (widget.rainfall >= 749.9) {
        setState(() {
          low = 750;
        });
      } else if (widget.rainfall >= 500 || widget.rainfall < 749.9) {
        setState(() {
          medium = 700;
        });
      } else if (widget.rainfall < 500) {
        setState(() {
          high = 500;
        });
      }
    } else if (widget.cropName == 'Okra') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 700;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Garden egg') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 700;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'Black beans (Akidi)') {
      if (widget.rainfall >= 800) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 700 || widget.rainfall < 800) {
        setState(() {
          medium = 750;
        });
      } else if (widget.rainfall < 700) {
        setState(() {
          high = 700;
        });
      }
    } else if (widget.cropName == 'Wild mango (Ogbono)') {
      if (widget.rainfall >= 799.9) {
        setState(() {
          low = 800;
        });
      } else if (widget.rainfall >= 600 || widget.rainfall < 799.9) {
        setState(() {
          medium = 700;
        });
      } else if (widget.rainfall < 600) {
        setState(() {
          high = 600;
        });
      }
    } else if (widget.cropName == 'African Star Apple (Udala)') {
      if (widget.rainfall >= 1000) {
        setState(() {
          low = 1000;
        });
      } else if (widget.rainfall >= 700 || widget.rainfall < 1000) {
        setState(() {
          medium = 800;
        });
      } else if (widget.rainfall < 700) {
        setState(() {
          high = 700;
        });
      }
    } else if (widget.cropName == 'Maize') {
      if (widget.rainfall >= 600) {
        setState(() {
          low = 600;
        });
      } else if (widget.rainfall >= 400 || widget.rainfall < 600) {
        setState(() {
          medium = 500;
        });
      } else if (widget.rainfall < 400) {
        setState(() {
          high = 400;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkRiskAssessment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 50,
                    minHeight: 2,
                  ),
                  child: Row(
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
                ),
                const SizedBox(height: 20),

                ///Name of product
                PhysicalModel(
                  color: Colors.white,
                  shadowColor: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 20,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 120,
                      minHeight: 20,
                    ),
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

                ///CROP REQUIREMENT
                IntrinsicHeight(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                      minWidth: double.infinity,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                      child: PhysicalModel(
                          color: Colors.white,
                          shadowColor: Colors.green,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
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

                              ///CROP REQUIREMENT
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
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),

                ///Pre-planting Operations
                IntrinsicHeight(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                      minWidth: double.infinity,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                      child: PhysicalModel(
                          color: Colors.white,
                          shadowColor: Colors.green,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///pest
                              ///
                              ///

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
                              const SizedBox(height: 10),
                            ],
                          )),
                    ),
                  ),
                ),

                ///planting operations
                IntrinsicHeight(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                      minWidth: double.infinity,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                      child: PhysicalModel(
                          color: Colors.white,
                          shadowColor: Colors.green,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
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
                              underLinedText('Pest'),
                              contextText(widget.pest),

                              //seven
                              const SizedBox(height: 12),
                              underLinedText('Pest Control'),
                              contextText(widget.pestControl),

                              //eight
                              const SizedBox(height: 12),
                              underLinedText('Disease'),
                              contextText(widget.disease),
//eight
                              const SizedBox(height: 12),
                              underLinedText('Symptoms'),
                              contextText(widget.symptoms),

                              //eight
                              const SizedBox(height: 12),
                              underLinedText('Disease Control'),
                              contextText(widget.diseaseControl),

                              //nine
                              const SizedBox(height: 12),
                              underLinedText('Harvest'),
                              contextText(widget.harvest),
                              const SizedBox(height: 10),
                            ],
                          )),
                    ),
                  ),
                ),

                ///post harvest operation
                IntrinsicHeight(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                      minWidth: double.infinity,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                      child: PhysicalModel(
                          color: Colors.white,
                          shadowColor: Colors.green,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
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
                              SizedBox(height: 10),
                            ],
                          )),
                    ),
                  ),
                ),

                ///Risk Assessment
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    'Risk Assessment',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),

                ///Risk assessment chart
                Container(
                  height: 200,
                  width: double.maxFinite,
                  child: PieChart(
                    dataMap: {
                      'Low': low,
                      'Medium': medium,
                      'High': high,
                    },
                    colorList: const [
                      Colors.green,
                      Colors.orangeAccent,
                      Colors.red
                    ],
                    chartRadius: 300,
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                    animationDuration: const Duration(milliseconds: 2000),
                  ),
                ),
              ],
            ),
          ),
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
            style: const TextStyle(fontSize: 10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Text(
            text,
            // softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              // color: Colors.pink,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
