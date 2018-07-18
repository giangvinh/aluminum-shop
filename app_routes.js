
exports.applyRoutes = function (app) {
    app.use('/', require('./routes_backend/login'));


    app.use('/admin/utility', require('./routes_backend/utility'));

    app.use('/admin/login', require('./routes_backend/login'));
    app.use('/admin/logout', require('./routes_backend/logout'));
    app.use('/admin/resetPasswordUser', require('./routes_backend/resetPasswordUser'));
    app.use('/admin/notification', require('./routes_backend/notification'));
    app.use('/admin/upload-hinh', require('./routes_backend/upload-hinh'));
    app.use('/admin/test', require('./routes_backend/test'));




    app.use('/admin/danh-sach-san-pham', require('./routes_backend/danh-sach-san-pham'));
    app.use('/admin/danh-sach-san-pham-don-vi', require('./routes_backend/danh-sach-san-pham-don-vi'));
    app.use('/admin/danh-sach-danh-muc-san-pham', require('./routes_backend/danh-sach-danh-muc-san-pham'));
    app.use('/admin/danh-sach-nhap-kho', require('./routes_backend/danh-sach-nhap-kho'));
    app.use('/admin/danh-sach-don-hang', require('./routes_backend/danh-sach-don-hang'));
    app.use('/admin/danh-sach-user-admin', require('./routes_backend/danh-sach-user-admin'));
    app.use('/admin/danh-sach-quyen', require('./routes_backend/danh-sach-quyen'));
    app.use('/admin/quan-ly-san-pham-ban-chay', require('./routes_backend/quan-ly-san-pham-ban-chay'));


    app.use('/admin/them-san-pham', require('./routes_backend/them-san-pham'));
    app.use('/admin/them-san-pham-don-vi', require('./routes_backend/them-san-pham-don-vi'));
    app.use('/admin/them-danh-muc-san-pham', require('./routes_backend/them-danh-muc-san-pham'));
    app.use('/admin/them-user-admin', require('./routes_backend/them-user-admin'));
    app.use('/admin/them-quyen', require('./routes_backend/them-quyen'));
    app.use('/admin/them-don-hang', require('./routes_backend/them-don-hang'));

    app.use('/admin/sua-san-pham', require('./routes_backend/sua-san-pham'));
    app.use('/admin/sua-san-pham-don-vi', require('./routes_backend/sua-san-pham-don-vi'));
    app.use('/admin/sua-danh-muc-san-pham', require('./routes_backend/sua-danh-muc-san-pham'));
    app.use('/admin/sua-user-admin', require('./routes_backend/sua-user-admin'));
    app.use('/admin/sua-quyen', require('./routes_backend/sua-quyen'));



    app.use('/admin/bao-cao-ban-hang-day-du', require('./routes_backend/bao-cao-ban-hang-day-du'));
    app.use('/admin/bao-cao-doanh-so-theo-nganh-hang', require('./routes_backend/bao-cao-doanh-so-theo-nganh-hang'));
    app.use('/admin/thong-ke-tai-san', require('./routes_backend/thong-ke-tai-san'));


}

