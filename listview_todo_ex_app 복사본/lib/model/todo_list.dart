class TodoList { // Method없는 클래스를 Model이라고 부른다
  // Property
  String imagePath;
  String workList;

  // Constructer
  TodoList(
    {
      required this.imagePath,  // required로 쓰인것은 반드시 있어야 한다.
      required this.workList
    }
  );
}