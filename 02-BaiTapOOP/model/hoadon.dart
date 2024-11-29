//Đây là hoá đơn
import 'dienthoai.dart';
import '';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDTKhachHang;

  //Constructor
  HoaDon(
      this._maHoaDon,
      this._ngayBan,
      this._dienThoaiDuocBan,
      this._soLuongMua,
      this._giaBanThucTe,
      this._tenKhachHang,
      this._soDTKhachHang);

  //Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDTKhachHang => _soDTKhachHang;

  //Setters
  //Mã hoá đơn không rỗng, định dạng "HD-XXX"
  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isNotEmpty && RegExp(r'^HD-\w{3}$').hasMatch(maHoaDon)) {
      _maHoaDon = maHoaDon;
    }
  }

  //Ngày bán không sau ngày hiện tại
  set ngayBan(DateTime ngayBan) {
    if (!ngayBan.isAfter(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  //Số lượng mua
  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= dienThoaiDuocBan.soLuongTon) {
      _soLuongMua = soLuongMua;
    }
  }

  //Giá bán thực tế
  set giaBanThucTe(double giaBanThucTe) {
    _giaBanThucTe = (giaBanThucTe > 0) ? giaBanThucTe : _giaBanThucTe;
  }

  set tenKhachHang(String tenKhachHang) {
    _tenKhachHang = (tenKhachHang.isNotEmpty) ? tenKhachHang : _tenKhachHang;
  }

  set soDTKhachHang(String soDTKhachHang) {
    // Kiểm tra số điện thoại theo định dạng: ví dụ số điện thoại phải có 10 chữ số và bắt đầu bằng "0"
    if (RegExp(r'^\d{10}$').hasMatch(soDTKhachHang)) {
      _soDTKhachHang = soDTKhachHang;
    }
  }

  //METHODS
  double tinhTongTien() {
    return soLuongMua * giaBanThucTe;
  }

  double loiNhuanThucTe() {
    double tongGiaNhap = dienThoaiDuocBan.giaNhap * soLuongMua;
    double tongGiaBan = tinhTongTien();
    return tongGiaBan - tongGiaNhap; // Lợi nhuận thực tế = tổng tiền bán - tổng giá nhập
  }

  void hienThiThongTinHD() {
    print('[--------------------Thông tin hóa đơn--------------------]');
    print('Mã hóa đơn: $maHoaDon');
    print('Ngày bán: $ngayBan');
    print('Tên khách hàng: $tenKhachHang');
    print('Số điện thoại khách hàng: $soDTKhachHang');
    print('Số lượng mua: $soLuongMua');
    print('Giá bán thực tế: $giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('[--------------------------------------------------------]');
  }
}
