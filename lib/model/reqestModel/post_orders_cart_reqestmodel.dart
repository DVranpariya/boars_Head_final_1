class PostOrdersCartReqModel {
  String id;
  String quantity;

  PostOrdersCartReqModel({
    this.id,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": id,
      "password": quantity,
    };
  }
}
