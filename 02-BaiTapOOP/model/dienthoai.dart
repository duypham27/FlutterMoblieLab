//Đây là điện thoại

class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;
  int _soLuongBan = 0;

  //Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);

  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;

  //Setters
  //Mã điện thoại không rỗng và định dạng "DT-XXX"
  set maDienThoai(String maDienThoai) {
    if (maDienThoai.isNotEmpty && RegExp(r'^DT-\w{3}$').hasMatch(maDienThoai)) {
      _maDienThoai = maDienThoai;
    }
  }

  set tenDienThoai(String tenDienThoai) {
    _tenDienThoai = (tenDienThoai.isNotEmpty) ? tenDienThoai : _tenDienThoai;
  }

  set hangSanXuat(String hangSanXuat) {
    _hangSanXuat = (hangSanXuat.isNotEmpty) ? hangSanXuat : _hangSanXuat;
  }

  set giaNhap(double giaNhap) {
    _giaNhap = (giaNhap > 0) ? giaNhap : _giaNhap;
  }

  set giaBan(double giaBan) {
    _giaBan = (giaBan > 0 && giaBan > giaNhap) ? giaBan : _giaBan;
  }

  set soLuongTon(int soLuongTon) {
    _soLuongTon = (soLuongTon > 0) ? soLuongTon : _soLuongTon;
  }

  //METHODS
  //Lợi nhuận dự kiến
  double loiNhuanDuKien() {
    return (giaBan - giaNhap) * soLuongTon;
  }

  //Hiển thị thông tin
  void hienThiThongTinDT() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn: $_soLuongTon');
    print("Tình trạng: ${_trangThai ? 'Có sẵn' : 'Hết hàng'}");;
  }

  //Kiểm tra có thể bán được hay không
  bool kiemTraCoTheBan() {
    return soLuongTon > 0;
  }
}
