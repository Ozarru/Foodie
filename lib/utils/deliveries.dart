import '../models/models.dart';

const localDeliveries = [
  TestDelivery(
    id: 1,
    eatry: "Mc Donald's",
    client: "Jason",
    eta: 30,
    price: 200,
    address: "23 cali road",
    items: ['burger', 'French fries'],
    payvet: true,
  ),
  TestDelivery(
    id: 2,
    eatry: "Croute Doree",
    client: "Henriette",
    eta: 20,
    price: 200,
    address: "23 cali road",
    items: ['Croisant', 'Bagguettes'],
    payvet: true,
  ),
  TestDelivery(
    id: 3,
    eatry: "Ci-gusta",
    client: "Antoine",
    eta: 15,
    price: 150,
    address: "23 cali road",
    items: ['pizza Regina'],
    payvet: false,
  ),
];
