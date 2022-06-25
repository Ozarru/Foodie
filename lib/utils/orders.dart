import '../models/models.dart';

double myLat = 6.137319026708222;
double mylng = 1.2560793270038038;

const localOrders = [
  TestOrder(
    eatry: "Akif",
    client: "Anita",
    eta: 20,
    address: "23 rue Gbossime",
    radius: 18,
    items: ['burger', 'French fries'],
    startLat: 6.13305134879669,
    startLng: 1.2353881547484222,
    stopLat: 6.180655259130151,
    stopLng: 1.1952999547485093,
  ),
  TestOrder(
    eatry: "Croute Doree",
    client: "Henriette",
    eta: 10,
    address: "105 rue Tchoou Blvd du 13 janv. Immeuble Fiata",
    radius: 7,
    items: ['Croisant', 'Bagguettes'],
    startLat: 6.139094009081748,
    startLng: 1.2294176970757689,
    stopLat: 6.147042988524481,
    stopLng: 1.2088389857267496,
  ),
  TestOrder(
    eatry: "Ci-gusta",
    client: "Antonia",
    eta: 10,
    address: "105 rue Tchoou",
    radius: 12,
    items: ['Pizza Regina, Greek salad'],
    startLat: 6.130858640211278,
    startLng: 1.2140169547483848,
    stopLat: 6.137319026708222,
    stopLng: 1.2560793270038038,
  ),
];
