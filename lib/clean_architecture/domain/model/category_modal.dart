class Categorys {
  String? id;
  String? name;
  String? description;

  Categorys(
    this.id,
    this.name,
    this.description,
  );

  Categorys.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Categorys.empty(){
    id = '';
    name = '';
    description = '';
  }

  Map<String, dynamic> toFilterMap(){
    return {
      'name': name!,
    };
  }
}
