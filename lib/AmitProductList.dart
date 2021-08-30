class Product{
  String name = '';
  int id = 0;
  int price = 0;
  String avatar ='';
  String title ='';
  int category_id =0;



  Product.fromJson(Map<String, dynamic> json){
    print('called constructor');
    print(json);
    name = json['name'];
    id = json['id'];
    price = json['price'];
    avatar = json['avatar'];
    title = json['title'];
    category_id = json['category_id'];
  }

}
class categories{
  String name = '';
  int id = 0;
  String avatar ='';
  String title ='';




  categories.fromJson(Map<String, dynamic> json){
    print('called constructor');
    print(json);
    name = json['name'];
    id = json['id'];
    avatar = json['avatar'];

  }

}




