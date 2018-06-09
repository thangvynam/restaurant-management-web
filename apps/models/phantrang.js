var q = require('q')
var db = require('../common/database')

// BƯỚC 1: KẾT NỐI CSDL
var conn = db.getConnection()

// BƯỚC 2: TÌM TỔNG SỐ RECORDS

function totalRecords(){

	var sql = "SELECT count(*) as total FROM monan";
 	var a =''
	var query = conn.query(sql, function(err, result) {
 
		a =  result[0].total
 
	});
	return a
}

function getRecord(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM monan',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}

function  getProduct(start, limit){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM monan LIMIT ?, ?',[start, limit],(err,result)=>{
		if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
	})
	return defer.promise
}





module.exports = {
	totalRecords:totalRecords,
	getRecord:getRecord,
	getProduct:getProduct
}