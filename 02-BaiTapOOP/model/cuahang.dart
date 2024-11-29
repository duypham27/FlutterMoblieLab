//Đây là cửa hàng

import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDT = [];
  List<HoaDon> _danhSachHD = [];

  //Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  //// Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDT => _danhSachDT;
  List<HoaDon> get danhSachHD => _danhSachHD;

  //Methods
  /*BEGIN-CÁC PHƯƠNG THỨC QUẢN LÝ ĐIỆN THOẠI
  */
  //Thêm điện thoại mới
  void themDienThoaiMoi(DienThoai dt) {
    danhSachDT.add(dt);
  }

  //Cập nhật thông tin điện thoại
  void capNhatDienThoai(DienThoai dt) {
    // Tìm điện thoại theo mã
    for (var i = 0; i < danhSachDT.length; i++) {
      if (danhSachDT[i].maDienThoai == dt.maDienThoai) {
        danhSachDT[i] = dt; // Cập nhật thông tin điện thoại
        print("Cập nhật điện thoại thành công!");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã ${dt.maDienThoai}");
  }

  //Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDT(DienThoai dt) {
    for (var i = 0; i < danhSachDT.length; i++) {
      if (danhSachDT[i].maDienThoai == dt.maDienThoai) {
        danhSachDT[i].soLuongTon =
            0; // Đặt số lượng tồn là 0 để ngừng kinh doanh
        danhSachDT[i].giaBan =
            0; // Đặt giá bán thành 0 (hoặc có thể đánh dấu trạng thái khác)
        print("Điện thoại ${danhSachDT[i].tenDienThoai} đã ngừng kinh doanh.");
        return;
      }
    }
    print(
        "Không tìm thấy điện thoại với mã ${dt.maDienThoai} để ngừng kinh doanh.");
  }

  //Tìm kiếm điện thoại(theo mã, tên, hãng)
  void timKiemDienThoai(DienThoai dt) {
    bool found = false;
    for (var dienThoai in danhSachDT) {
      // Tìm theo mã điện thoại
      if (dienThoai.maDienThoai != null &&
          dienThoai.maDienThoai == dt.maDienThoai) {
        dienThoai.hienThiThongTinDT();
        found = true;
      }
      // Tìm theo tên điện thoại
      else if (dienThoai.tenDienThoai != null &&
          dienThoai.tenDienThoai
              .toLowerCase()
              .contains(dt.tenDienThoai.toLowerCase())) {
        dienThoai.hienThiThongTinDT();
        found = true;
      }
      // Tìm theo hãng sản xuất
      else if (dienThoai.hangSanXuat != null &&
          dienThoai.hangSanXuat
              .toLowerCase()
              .contains(dt.hangSanXuat.toLowerCase())) {
        dienThoai.hienThiThongTinDT();
        found = true;
      }
    }

    if (!found) {
      print("Không tìm thấy điện thoại phù hợp.");
    }
  }

  //Hiển thị danh sách điện thoại
  void hienThiDanhSachDT() {
    if (_danhSachDT.isEmpty) {
      print("Danh sách điện thoại trống.");
      return;
    }

    print("[-----------------Danh sách điện thoại-----------------]");
    for (var dt in _danhSachDT) {
      dt.hienThiThongTinDT(); // Gọi phương thức hiển thị thông tin cho từng điện thoại
    }
    print("[------------------------------------------------------]");
  }
  /*END-CÁC PHƯƠNG THỨC QUẢN LÝ ĐIỆN THOẠI
  */

  /*BEGIN-CÁC PHƯƠNG THỨC QUẢN LÝ HOÁ ĐƠN
  */
  //Tạo hoá đơn mới
  void taoHoaDonMoi(HoaDon hd) {
    danhSachHD.add(hd);
    // Cập nhật số lượng tồn kho
    for (var dt in danhSachDT) {
      if (dt.maDienThoai == hd.dienThoaiDuocBan.maDienThoai) {
        dt.soLuongTon -= hd.soLuongMua;
      } else {
        print("Không đủ số lượng tồn kho để bán.");
        return;
      }
    }
    print("Tạo hóa đơn mới thành công: ${hd.maHoaDon}");
  }

  //Tìm kiếm hoá đơn
  void timKiemHoaDon(HoaDon hd) {
    bool found = false;

    // Lặp qua danh sách hóa đơn
    for (var hoaDon in danhSachHD) {
      // Tìm theo mã hóa đơn
      if (hoaDon.maHoaDon != null && hoaDon.maHoaDon == hd.maHoaDon) {
        hoaDon.hienThiThongTinHD();
        found = true;
      }
      // Tìm theo ngày bán (so sánh ngày)
      else if (hoaDon.ngayBan != null && hoaDon.ngayBan == hd.ngayBan) {
        hoaDon.hienThiThongTinHD();
        found = true;
      }
      // Tìm theo tên khách hàng
      else if (hoaDon.tenKhachHang != null &&
          hoaDon.tenKhachHang
              .toLowerCase()
              .contains(hd.tenKhachHang.toLowerCase())) {
        hoaDon.hienThiThongTinHD();
        found = true;
      }
    }

    if (!found) {
      print("Không tìm thấy hóa đơn phù hợp.");
    }
  }

  //Hiển thị danh sách hoá đơn
  void hienThiDanhSachHD() {
    if (_danhSachHD.isEmpty) {
      print("Danh sách hóa đơn trống !");
      return;
    }

    print("[-----------------Danh sách hóa đơn-----------------]");
    for (var hoaDon in _danhSachHD) {
      hoaDon
          .hienThiThongTinHD(); // Gọi phương thức hiển thị thông tin cho từng hóa đơn
    }
    print("[----------------------------------------------------]");
  }
  /*END-CÁC PHƯƠNG THỨC QUẢN LÝ ĐIỆN THOẠI
  */

  /*BEGIN-CÁC PHƯƠNG THỨC THỐNG KÊ
  */
  //Tổng doanh thu theo khoảng thời gian
  double tongDoanhThuTheoThoiGian(DateTime startDate, DateTime endDate) {
    double tongDoanhThu = 0.0;

    // Lặp qua danh sách hóa đơn
    for (var hoaDon in danhSachHD) {
      // Kiểm tra nếu ngày bán của hóa đơn nằm trong khoảng thời gian
      if (hoaDon.ngayBan != null &&
          hoaDon.ngayBan.isAfter(startDate) &&
          hoaDon.ngayBan.isBefore(endDate)) {
        // Tính tổng doanh thu của hóa đơn dựa trên các sản phẩm trong hóa đơn
        double doanhThuHoaDon =
            hoaDon.dienThoaiDuocBan.giaBan * hoaDon.soLuongMua;
        tongDoanhThu += doanhThuHoaDon;
      }
    }

    // Trả về tổng doanh thu
    return tongDoanhThu;
  }

  //Tổng lợi nhuận theo khoảng thời gian
  double tongLoiNhuanTheoThoiGian(DateTime startDate, DateTime endDate) {
    double tongLoiNhuan = 0.0;

    // Lặp qua danh sách hóa đơn
    for (var hoaDon in _danhSachHD) {
      // Kiểm tra nếu ngày bán của hóa đơn nằm trong khoảng thời gian
      if (hoaDon.ngayBan != null &&
          hoaDon.ngayBan.isAfter(startDate) &&
          hoaDon.ngayBan.isBefore(endDate)) {
        // Tính doanh thu từ hóa đơn
        double doanhThuHoaDon =
            hoaDon.dienThoaiDuocBan.giaBan * hoaDon.soLuongMua;

        // Tính chi phí từ hóa đơn
        double chiPhiHoaDon =
            hoaDon.dienThoaiDuocBan.giaNhap * hoaDon.soLuongMua;

        // Tính lợi nhuận (doanh thu - chi phí)
        double loiNhuanHoaDon = doanhThuHoaDon - chiPhiHoaDon;

        // Cộng lợi nhuận của hóa đơn vào tổng lợi nhuận
        tongLoiNhuan += loiNhuanHoaDon;
      }
    }

    // Trả về tổng lợi nhuận
    return tongLoiNhuan;
  }

  //Thống kê top điện thoại bán chạy
  double thongKeDTBanChay() {
    // Khởi tạo một bản đồ để lưu tổng số lượng bán của từng điện thoại
    Map<String, int> soLuongBanRa = {};

    // Lặp qua tất cả các hóa đơn
    for (var hoaDon in danhSachHD) {
      String maDienThoai = hoaDon.dienThoaiDuocBan.maDienThoai;
      int soLuongMua = hoaDon.soLuongMua;

      // Cập nhật số lượng bán của điện thoại trong bản đồ
      soLuongBanRa[maDienThoai] = (soLuongBanRa[maDienThoai] ?? 0) + soLuongMua;
    }

    // Tìm điện thoại bán chạy nhất
    var topDienThoai =
        soLuongBanRa.entries.reduce((a, b) => a.value > b.value ? a : b);

    // Hiển thị điện thoại bán chạy nhất
    var dienThoaiBanChay =
        _danhSachDT.firstWhere((dt) => dt.maDienThoai == topDienThoai.key);
    print(
        "Điện thoại bán chạy nhất: ${dienThoaiBanChay.tenDienThoai} - Số lượng bán: ${topDienThoai.value}");

    return topDienThoai.value.toDouble();
  }

  //Thống kê tồn kho
  double thongKeTonKho() {
    double tongTonKho = 0;

    // Lặp qua tất cả các điện thoại trong danh sách
    for (var dt in _danhSachDT) {
      tongTonKho += dt.soLuongTon; // Cộng dồn số lượng tồn của mỗi điện thoại
    }

    print("Tổng tồn kho hiện tại: $tongTonKho");

    return tongTonKho; // Trả về tổng số lượng tồn kho
  }
  
}
