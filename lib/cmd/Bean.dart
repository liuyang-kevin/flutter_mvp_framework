/// @Desc: 辅助类，作为接收者Receiver的成员，包含两个属性，用来观察命令的执行情况
class PeopleBean {
  int age = -1; //年龄
  String name = "NULL"; //姓名

  PeopleBean({this.age, this.name});

  void update({age, name}) {
    if (age != null) {
      this.age = age;
    }

    if (name != null) {
      this.name = name;
    }
  }

  /// @return 返回一个PeopleBean的克隆对象
  PeopleBean clone() {
    return PeopleBean(age:this.age, name:this.name);
  }

  String toString() {
    return " 【年龄：" + age.toString() + "\t姓名：" + name + "】";
  }
}