import 'Bean.dart';

/// 命令的具体执行类[接收者角色], 命令接收者可以是任意的类，只要实现了命令要求实现的相应功能即可。
class Receiver {
  PeopleBean people;

  //具体命令操作的缓存栈，用于回滚。这里为了方便就用一个PeopleBean来代替
  PeopleBean peopleCache = PeopleBean();

  Receiver.initOne() {
    this.people = PeopleBean(age: -1, name: "NULL"); //初始化年龄为-1，姓名为NULL
  }

  Receiver(this.people);

  /// 具体操作方法[修改年龄和姓名]
  void opActionUpdateAge(int age) {
    print("执行命令前：" + people.toString());
    people.update(age: age);
    print("执行命令后：" + people.toString() + "\n");
  }

  //修改姓名
  void opActionUpdateName(String name) {
    print("执行命令前：" + people.toString());
    people.update(name: name);
    print("执行命令后：" + people.toString() + "\n");
  }

  /// 回滚操作，用于撤销opAction执行的改变
  void rollBackAge() {
    people.update(age: peopleCache.age);
    print("命令回滚后：" + people.toString() + "\n");
  }

  void rollBackName() {
    people.update(name: peopleCache.name);
    print("命令回滚后：" + people.toString() + "\n");
  }
}
