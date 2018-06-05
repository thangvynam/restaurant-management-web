var q = require('q')
var db = require('../common/database')

var conn = db.getConnection()




function addChiNhanh(user){
	if(user){
		var defer = q.defer()

		var query = conn.query('INSERT INTO admin SET ?', chinhanh, (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		})

		return defer.promise
	}
	return false
}


function getAllChiNhanh(){
	var defer = q.defer()
	var query = conn.query('SELECT * FROM chinhanh',(err,result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})
	return defer.promise

}

function taiAnhChiNhanh(id, link){
	if(id && link){
		var defer = q.defer()

		var query = conn.query('UPDATE chinhanh SET hinhanh=? WHERE id=?',
			[link, id], (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		}) 
		return defer.promise
	}
	return false
}

function getChiNhanhById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM chinhanh WHERE ?',{id:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}

function updateChiNhanh(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE chinhanh SET ten=?, thongtin=?, hinhanh=? WHERE id=?',
			[params.ten, params.thongtin, params.hinhanh, params.id], (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		}) 
		return defer.promise
	}
	return false
}

function themChiNhanh(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('INSERT INTO chinhanh SET ?', params, (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		})

		return defer.promise
	}
	return false
}

function xoaChiNhanh(id){
	if(id){
		var defer = q.defer()

		var query = conn.query('DELETE FROM chinhanh WHERE id=?',[id], (err, result)=>{
			if(err){
				defer.reject(err)
			}else{
				defer.resolve(result)
			}
		}) 
		return defer.promise
	}
	return false
}



module.exports = {
	addChiNhanh: addChiNhanh,
	getAllChiNhanh: getAllChiNhanh,
	taiAnhChiNhanh: taiAnhChiNhanh,
	getChiNhanhById: getChiNhanhById,
	updateChiNhanh: updateChiNhanh,
	themChiNhanh: themChiNhanh,
	xoaChiNhanh: xoaChiNhanh
}