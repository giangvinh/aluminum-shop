var express = require('express');
var router = express.Router();
var db = require('../databases/database');
var api = require('../api/response');
const uuidv1 = require('uuid/v1');

// GET home page
router.get('/', function (req, res, next) {
    var id = req.query.id;

    db.getAllDanhMucSanPham(function (error, danhmuc) {
        if (error) {
            return;
        }
        console.log(324324234234);
        console.log(danhmuc);
        res.render('admin/them-san-pham-don-vi', {
            danhmuc: danhmuc
        });
    });
});


router.post('/them', function (req, res, next) {
    if(!req.session.username){
        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "hết phiên làm việc"));
        return;
    }
    var obj = req.body;
    var product_category_id = obj.product_category_id;
    var code = obj.code;
    var quantity = obj.sl;
    var price = obj.price;
    var weight = obj.weight;
    var unit = obj.unit;
    var name_vi = obj.name;
    var parent_id =  null;
    var id = uuidv1();
    var entity_code = api.ENUM_ENTITY_CODE.PRD;
    var created_date = api.getNow();
    var created_by = req.session.username;
    var status = 1;
    var rating = 0;
    var color=obj.color;
    var order=obj.order;

    db.insertSanPham(id, product_category_id, code, name_vi,
        null, quantity, null, name_vi, null,
        price, weight, parent_id, entity_code,
        created_date, created_by, unit, null, null, status
        , order, rating, null, null,color, function (error, result) {
            if (error) {
                res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "lỗi mạng"));
                return;
            }

            var idWarehouse = uuidv1();
            db.insertWarehouse(idWarehouse,id,0,created_date,created_by,status,function (error10, rs) {
                if(error10){
                    res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm dữ liệu vào warehouse"));
                    return;
                }

                var idWareHouseHistory = uuidv1();
                db.insertWarehouseHistory(idWareHouseHistory,idWarehouse,id,0,3,created_by,created_date,1,function (error11, rs1) {
                    if(error11){
                        res.json(api.getResponse(api.ERRO_NOT_FOUND, null, "Không thể thêm dữ liệu vào warehouse history"));
                        return;
                    }
                    res.json(api.getResponse(api.SUCC_EXEC, {
                        id: id
                    }, ""));

                })
            })
    })


});



module.exports = router;
