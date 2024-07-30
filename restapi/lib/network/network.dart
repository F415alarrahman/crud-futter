const url = "http://localhost:8080/ToDoListApi/web";

class NetworkURL {
  static String getData() {
    return "$url/get.php";
  }

  static String addData() {
    return "$url/add.php";
  }

  static String updateData() {
    return "$url/ubah_data.php";
  }

  static String updateHistory() {
    return "$url/ubah_history.php";
  }

  static String deleteData() {
    return "$url/delete.php";
  }
}
