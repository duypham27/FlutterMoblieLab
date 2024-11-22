/**
 * Bài tập ex06:
 * Viết chương trình chuyển đổi 1 số nguyên (n >= 1) được nhập từ bàn phím thành số nhị phân
 */
import 'dart:io';
void main()
{
  int n = 0;
  do {
    stdout.write('Nhập n (n >= 1): ');
    String? inputN = stdin.readLineSync();

    if (inputN != null) {
      n = int.tryParse(inputN) ?? 0;
    }
    if (n == 0) {
      print("Vui lòng nhập lại: ");
    }
  } while (n < 1);

    // Chuyển đổi số thập phân sang nhị phân
    String binary = '';
    int temp = n;

  while (temp > 0) {
    // Lấy phần dư
    int phandu = temp % 2;
    // Thêm phần dư vào trước chuỗi binary
    binary = phandu.toString() + binary;
    // Chia lấy phần nguyên
    temp = temp ~/ 2;
  }
    print('Số $n trong hệ nhị phân là: $binary');
}