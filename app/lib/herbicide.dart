import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newkhet/chemicals.dart';
import 'package:newkhet/utils.dart';
import 'package:http/http.dart' as http;

class herb extends StatefulWidget {
  const herb({super.key});

  @override
  State<herb> createState() => _herbState();
}

class _herbState extends State<herb> {
  String? resultData;
  final List<String> options1 = [
    'Rice',
    'Wheat',
    'Maize',
    'Cotton',
    'Tea',
    'Coffee'
  ];

  final Map<String, List<String>> options2 = {
    'Rice': [
      'Barnyard grass',
      'Jungle rice',
      'Coastal grass',
      'Rice flatsedge',
      'Smallflower umbrella sedge',
      'Fimbristylis',
      'Sedges',
      'Common fimbry',
      'Water primrose',
      'False daisy',
      'Cape bergia',
      'European water clover',
      'Ammania',
      'Beakfruit',
      'Asian spiderwort',
      'Sessile joyweed',
      'Roys Bulrush',
      'Coco grass',
      'Alligator weed',
      'Panic grass',
      'Goosegrass',
      'Benghal dayflower',
      'Foxtail',
      'Large crabgrass',
      'False amaranth',
      'Chanca piedra',
      'Toothache plant',
      'Bengal dayflower',
      'Common lambsquarters',
      'Purple nutsedge',
      'Small waterclover',
      'Pickerelweed',
      'Variable flatsedge',
      'Smallflower ludwigia',
      'Crowfoot grass',
      'Bermuda grass',
      'Moses-in-a-cradle',
      'Scrambled eggs',
      'Fringed cyperus',
      'Bulrush',
      'Marsh dewflower',
      'Large crabgrass',
      'Splittop paspalum',
      'Knotroot bristlegrass',
      'Southern cutgrass',
      'Torpedo grass',
      'Yellow foxtail',
      'Red maidenhair',
      'Alligator weed',
      'Khakiweed',
      'Bacopa monnieri',
      'Prostrate eclipta',
      'Blue butterfly-plant',
      'Ciliate swampweed',
      'Sri Lanka screwpine',
      'Spreading dayflower',
      'Nutgrass',
      'Creeping morning glory',
      'Common Fogfruit',
      'Water snowflake',
      'Water hyacinth',
      'Creeping woodsorrel',
      'Creeping water primrose',
      'Coastal plain thoroughwort',
      'Bacopa monnieri',
      'Mountain caesulia',
      'Millet grass',
      'Dwarf copperleaf',
      'Four-leaved clover fern',
      'Bacca weed',
      'Heart-shaped Leafweed',
      'Chinese Sprangletop',
      'Torpedo Grass',
      'Tape grass',
      'Beal plant',
      'Alternanthera',
      'Caesulia'
    ],
    'Wheat': [
      'Lambs quarters',
      'Indian sweet clover',
      'White sweet clover',
      'Toothed medick',
      'Yellow pea',
      'Scarlet pimpernel',
      'Common vetch',
      'Canada thistle',
      'Dock',
      'Mallow',
      'Canary Grass',
      'Small-flowered fumitory',
      'Fine-leaved asphodel',
      'Field bindweed',
      'Rough Leucas',
      'White Goosefoot',
      'Mexican Prickly Poppy',
      'Millet Fimbry',
      'Spiny Amaranth',
      'Onionweed',
      'Corn spurry',
      'Wild oat',
      'Littleseed canarygrass',
      'Lesser Swinecress',
      'Annual bluegrass',
      'Thinleaf false asphodel',
      'Blessed milkthistle',
      'False lettuce',
      'Arrowleaf rabbitbush',
      'Yellow sweetclover',
      'Spring vetch',
      'Barrel medic',
      'Black medic',
      'Stonebreaker',
      'Purslane',
      'Pin grass'
    ],
    'Maize': [
      'Desert Horse Purslane',
      'False Amaranth',
      'Barnyard Grass',
      'Goosegrass',
      'Common Cocklebur',
      'Signalgrass',
      'Crabgrass',
      'Slender Amaranth',
      'Asian Spiderflower',
      'Smartweed',
      'Pigweed',
      'Puncture Vine',
      'Spreading Hogweed',
      'Asthma Plant',
      'Purslane',
      'Stonebreaker',
      'Knotted spurge',
      'Spiny amaranth',
      'Yellow beeplant',
      'Woolly cudweed',
      'Nutgrass',
      'Flatsedge',
      'Indian Goosegrass',
      'Egyptian grass',
      'Purpletop grass',
      'Congress weed',
      'Digera',
      'Green Amaranth',
      'Small-flowered ground cherry',
      'Dwarf copperleaf',
      'Field bindweed',
      'Silver cocks comb'
    ],
    'Cotton': [
      'Amaranth',
      'Lambs quarters',
      'Field bindweed',
      'Yellow foxtail',
      'Crabgrass',
      'Purslane',
      'Cocklebur',
      'Scarlet pimpernel',
      'Fine-leaf asphodel',
      'Spurge',
      'Common vetch',
      'Hairy seeded paspalum',
      'Barnyard grass',
      'Goosegrass',
      'Egyptian grass',
      'Little lovegrass',
      'Jungle rice',
      'Velvet crabgrass',
      'Low brachiaria',
      'Arabian grass',
      'Bristly starbur',
      'Spider flower',
      'Jimsonweed',
      'Desert horse purslane',
      'Coat buttons',
      'Bermuda grass',
      'Pigweed',
      'Rough chaff flower',
      'Spiny burr grass',
      'Large crabgrass',
      'Panic grass',
      'Felt-leaved lagasca',
      'Clustered vine',
      'Indian agate',
      'Para grass',
      'Asiatic dayflower',
      'Congress grass',
      'Benghal dayflower',
      'Cockscomb'
    ],
    'Tea': [
      'Torpedo grass',
      'Hairy buttonweed',
      'Cogon grass',
      'Large crabgrass',
      'Benghal dayflower',
      'Billygoat weed',
      'Goosegrass',
      ' Sour paspalum',
      'Bengal grass',
      'Carpet grass',
      'Bermuda grass',
      'Wild rye',
      'Kodo millet',
      'Asiatic tearthumb',
      'Spanish needles',
      'Pineland buttonweed',
      'Purple nutsedge',
      'Spurge',
      'Indian acalypha',
      'Chicory',
      'Digera',
      'Lovegrass',
      'Beach morning glory',
      'Hairy seeded paspalum',
      'Spinyhead sida',
      'Beggar Ticks',
      'Fleabane',
      'Thickhead',
      'Gallant soldier',
      'Touch-me-Not',
      'Siam weed',
      'Lantana'
    ],
    'Coffee': [
      'Hairy crabgrass',
      'Herring grass',
      'Billygoat weed',
      'Fleabanes',
      'Hairy buttonweed',
      'Asthma weed',
      'Benghal dayflower',
      'Goosegrass'
    ]
  };

  String? selectedOption1;
  String? selectedOption2;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // androidlarge4JHt (53:51)
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group4Dve (53:52)
              padding:
                  EdgeInsets.fromLTRB(8 * fem, 16 * fem, 8 * fem, 16 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfff9c449),
              ),
              child: Align(
                // vectorkQn (53:54)
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: Chemicals(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 40 * fem,
                    height: 29 * fem,
                    child: Image.asset(
                      'assets/vector-1kJ.png',
                      width: 40 * fem,
                      height: 29 * fem,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupmhgs38z (39oe9BdWaXo9phaBG7mhgS)
              padding:
                  EdgeInsets.fromLTRB(28 * fem, 9 * fem, 13 * fem, 94 * fem),
              width: double.infinity,
              height: 740 * fem,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0x8cf9c449), Color(0x00f9c449)],
                  stops: <double>[0, 0.686],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // herbicider6S (53:56)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 20 * fem, 30 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('Herbicide\n'),
                    ),
                  ),
                  Container(
                    // thistoolallowsyoutofindtheopti (71:15)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 20 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 319 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text(
                          'This tool allows you to find the optimal herbicide to use based on what crop you have and the weed affecting it'),
                    ),
                  ),
                  Container(
                    // enteryourcropbTL (71:9)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 127 * fem, 20 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('Enter your crop '),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * fem, vertical: 1 * fem),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 132, 188, 133),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8 * fem),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedOption1,
                      items: options1
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Update the selected option for the first dropdown menu
                        setState(() {
                          selectedOption1 = value;
                          selectedOption2 =
                              null; // reset selectedOption2 when the first dropdown changes
                        });
                      },
                    ),
                  ),
                  Container(
                    // whatweedaffectsyourcropoZQ (53:58)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 55 * fem, 20 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 264 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('What weed affects your crop?'),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * fem, vertical: 15 * fem),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 132, 188, 133),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8 * fem),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedOption2,
                      items: selectedOption1 != null
                          ? options2[selectedOption1]
                                  ?.map((option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ))
                                  .toList() ??
                              []
                          : [],
                      onChanged: (value) {
                        // Update the selected option for the second dropdown menu
                        setState(() {
                          selectedOption2 = value!;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Create a Map object to hold the selected options
                      Map<String, String?> payload = {
                        'crop': selectedOption1,
                        'problem': selectedOption2,
                      };

                      // Convert the Map to a JSON string
                      String jsonPayload = json.encode(payload);
                      String url = 'https://herbicide.anurondutta.repl.co/';
                      ;
                      Map<String, String> headers = {
                        'Content-Type': 'application/json'
                      };

                      final response = await http.post(Uri.parse(url),
                          headers: headers, body: jsonPayload);

                      // Update the state with the result data
                      setState(() {
                        resultData = response.body
                            .substring(11, (response.body.length - 3));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 68 * fem,
                        vertical: 0 * fem,
                      ),
                      backgroundColor: const Color(0xff40e58c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),

// Display the result data using a Text widget
                  if (resultData != null)
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 139, 135, 135),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 20.0),
                        child: Text(resultData!),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
