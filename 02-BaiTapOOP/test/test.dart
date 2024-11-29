/*
Quản lý cửa hàng bán điện thoại
*/
import '../model/dienthoai.dart';
import '../model/hoadon.dart';
import '../model/cuahang.dart';

void main() {
  //ĐIỆN THOẠI
  //Test điện thoại ban đầu
  var dt = DienThoai(
      "SS0001", "Samsung A24", "Samsung", 25000000, 32000000, 4, true);

  // Thêm điện thoại mới
  var dtMoi =
      DienThoai("DT-002", "iPhone 14", "Apple", 20000000, 25000000, 10, true);
  print('\nThông tin điện thoại mới: ');
  dtMoi.hienThiThongTinDT();

  // Cập nhật thông tin điện thoại
  // Cập nhật giá bán và số lượng tồn
  dt.maDienThoai = "DT-003";
  dt.tenDienThoai = "Samsung Galaxy S22";
  dt.giaBan = 35000000;
  dt.soLuongTon = 10;

  print('\nThông tin điện thoại sau khi cập nhật: ');
  dt.hienThiThongTinDT();

  // Kiểm tra validation
  // Thử cập nhật mã điện thoại không hợp lệ
  dt.maDienThoai = "ABC123"; // Mã không hợp lệ, phải có định dạng "DT-XXX"
  print('\nThông tin điện thoại sau khi thử cập nhật mã không hợp lệ: ');
  dt.hienThiThongTinDT();

  //HOÁ ĐƠN
  // Tạo hóa đơn hợp lệ
  var hoaDon = HoaDon("HD-001", DateTime.now(), dtMoi, 5, 25000000.0,
      "Nguyễn Văn A", "0123456789");

  // Kiểm tra các ràng buộc (tồn kho, validation)
  if (hoaDon.soLuongMua > dtMoi.soLuongTon) {
    print("\nSố lượng mua vượt quá số lượng tồn kho!");
  } else {
    // Tính toán tiền và lợi nhuận
    print("\nThông tin hóa đơn: ");
    hoaDon.hienThiThongTinHD();
    print("Lợi nhuận thực tế: ${hoaDon.loiNhuanThucTe()}");
  }

  // Test hóa đơn với số lượng mua vượt quá tồn kho
  var hoaDonSai = HoaDon(
      "HD-002",
      DateTime.now(),
      dtMoi,
      15, // Số lượng mua vượt quá số lượng tồn
      25000000.0,
      "Trần Thị B",
      "0987654321");

  if (hoaDonSai.soLuongMua > dtMoi.soLuongTon) {
    print("\nSố lượng mua vượt quá số lượng tồn kho!");
  } else {
    // Tính toán tiền và lợi nhuận
    print("\nThông tin hóa đơn sai: ");
    hoaDonSai.hienThiThongTinHD();
    print("Lợi nhuận thực tế: ${hoaDonSai.loiNhuanThucTe()}");
  }

  // Khởi tạo Cửa Hàng
  CuaHang ch = CuaHang("Điện Máy Xanh", "123 Đường ABC");

  ch.themDienThoaiMoi(dt);
  ch.themDienThoaiMoi(dtMoi);

  // Tạo hóa đơn
  var hoaDon1 = HoaDon("HD-001", DateTime(2024, 11, 1), dtMoi, 5, 20000000.0,
      "Nguyễn Văn A", "0123456789");
  var hoaDon2 = HoaDon("HD-002", DateTime(2024, 11, 5), dt, 3, 25000000.0,
      "Lê Thị B", "0987654321");

  // Doanh thu theo thời gian
  DateTime startDate = DateTime(2024, 11, 1);
  DateTime endDate = DateTime(2024, 11, 30);
  double doanhThu = ch.tongDoanhThuTheoThoiGian(startDate, endDate);
  print("\nDoanh thu từ $startDate đến $endDate: $doanhThu");

  // Lợi nhuận theo thời gian
  double loiNhuan = ch.tongLoiNhuanTheoThoiGian(startDate, endDate);
  print("Lợi nhuận từ $startDate đến $endDate: $loiNhuan");

  // Top bán chạy
  // print("\nTop bán chạy:");
  // var topBanChay = ch.thongKeDTBanChay();
  // for (var dt in topBanChay) {
  //   print("${dt.tenDienThoai} - Đã bán: ${dt.soLuongBan}");
  // }

  // Báo cáo tồn kho
  print("\nBáo cáo tồn kho:");
  ch.thongKeTonKho();
}
