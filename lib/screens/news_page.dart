import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
            elevation: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/farmer3.jpg'))),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Text(
              'Enforce Anti-Grazing Law, Else Food Scarcity\n‘Ll Persist, Farmers Tell Lawmakers.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'FARMERS under the aegis of Farmers/Hunters association of Nigeria, Oke-Ogun chapter, have urged Nigerian lawmakers to press it on the Federal Government (FG) to enforce anti-grazing law, as the only recipe to curb a seemingly increase of food scarcity in the country. This appeal, was made by the President of the association in Oyo and Kwara State, Chief Samson Alabi Ojoawo, while addressing journalists at the first meeting of the year organised by the association at the association hall, Oge area,Saki town, Oyo State, recently. Chief Ojoawo said the only factor to check the scarcity of food in the country is to curb the incessant herding of cattle by the herder’s on farms across Nigerian farmlands. He noted that the herders get away by destroying several farmlands and crops because the authority has failed to check them, hence, the helpless masses and the farmers continue to bear the burden. According to him, “we have continued to call on our leaders in this side of the country to pass our tale to the Federal Government to ensure they stop these Fulani herders from destroying our farmlands. We have continued to lose our farmlands to the illegal activities of the herders. “There’s no way these herders will be left uncontrolled, unchecked to roam our lands and expect the farmers to have bountiful harvests. Our lawmakers at the federal  level should ensure that the Federal Government act fast. Things are getting worse. Except you’re privileged to move round our farms and forest, you can never know the extent of the damage. Only that can stop food shortage in the country.”He also called on leaders from the south who have cattle with the herders to be on the side of the people, noting that this is also giving the herders undue advantage by misbehaving anytime there were issues on encroachment of farms.Chief Ojoawo, further urged the lawmakers to as a matter of urgency compel Presidency to implement anti open grazing law. The herder’s should not be above the law.The General Secretary of the association, Chief Moses Akano, who buttressed Chief Ojoawo’s claim noted that the association under the present executive will continue to pursue the goals of the founding fathers, however called on members not to take laws unto their hands in dealing with the herders.“This annual meeting to review the activities of this association started about 35 years ago. We will not let our members or the founding fathers down by holding firmly to the goals. Meanwhile, I am using this opportunity to call on our members not to take laws to their hands. We have sent message to the authority with likely repercussions, let’s do everything within the ambit of the law of the land,” Akano said.',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
