import 'package:equatable/equatable.dart';

class Test  extends Equatable{
  String? name;
  String? id;
  int? age;

  Test(this.name, this.id, this.age);
//هنا هيعمل check علي اللي بقولهوله ف الليست تحت
  @override
  // TODO: implement props
  List<Object?> get props => [name,id,age];


//equatable
//ده عشان تكرار الداتا ميحصلش ان كلهم يكون ليهم نفس الهاش كود يعني كلهم بيشاوروا علي نفس ال reference ف هنعرف ان في تكرار داتا

//emutable
//بيخلي الداتا كلها نوعها final لحد ما نعمل  assgin للداتا وتاخد نوعه من اللي دخلها
}
