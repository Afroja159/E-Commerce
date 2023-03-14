class Product {
  int? id;
  String? name;
  String? details;
  double? price;
  String? img;
  int quantity = 1;

  Product({this.id, this.name, this.details, this.price, this.img});
}

List<Product> productList = [
  Product(
      id: 01,
      name: "HP 17z-cp300",
      details: "Gaming Laptop",
      price: 650.00,
      img: "images/1.png"),
  Product(
      id: 02,
      name: "HP 15t-eg200",
      details: "Gaming Laptop",
      price: 499.99,
      img: "images/2.png"),
  Product(
      id: 03,
      name: "HP 16t-k000",
      details: "Gaming Laptop",
      price: 949.99,
      img: "images/3.png"),
  Product(
      id: 04,
      name: "Laptop 16t-f100",
      details: "Gaming Laptop",
      price: 1649.99,
      img: "images/4.png"),
  Product(
      id: 05,
      name: "HP 16-f1747nr",
      details: "Gaming Laptop",
      price: 1399.99,
      img: "images/5.png"),
  Product(
      id: 06,
      name: "HP Laptop 15t-fa000",
      details: "Gaming Laptop",
      price: 999.99,
      img: "images/6.png"),
  Product(
      id: 07,
      name: "HP Laptop 17z-cp300",
      details: "Gaming Laptop",
      price: 650.00,
      img: "images/1.png"),
  Product(
      id: 08,
      name: "HP Laptop 15t-eg200",
      details: "Gaming Laptop",
      price: 499.99,
      img: "images/2.png"),
  Product(
      id: 09,
      name: "HP 16t-k000",
      details: "Gaming Laptop",
      price: 949.99,
      img: "images/3.png"),
  Product(
      id: 10,
      name: "HP 16t-f100",
      details: "Gaming Laptop",
      price: 1649.99,
      img: "images/4.png"),
  Product(
      id: 11,
      name: "HP 16-f1747nr",
      details: "Gaming Laptop",
      price: 1399.99,
      img: "images/5.png"),
  Product(
      id: 12,
      name: "HP 15t-fa000",
      details: "Gaming Laptop",
      price: 999.99,
      img: "images/6.png"),
];
