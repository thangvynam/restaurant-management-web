var q = require('q')  
var db = require('../common/database')

var conn = db.getConnection()

function getAllMonAn(){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM monan', (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}

function themMonAn(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('INSERT INTO monan SET ?', params, (err, result)=>{
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

function getMonAnById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM monan WHERE ?',{id:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}


function updateMonAn(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE monan SET ten=?, gia=?, nguyenlieu=?, hinhanh=?, gioithieu=?, bua=? WHERE id=?',
			[params.ten, params.gia, params.nguyenlieu, params.hinhanh, params.gioithieu, params.bua ,params.id], (err, result)=>{
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

function deleteMonAn(id){
	if(id){
		var defer = q.defer()

		var query = conn.query('DELETE FROM monan WHERE id=?',[id], (err, result)=>{
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

function taiAnhMonAn(id, link){
	if(id && link){
		var defer = q.defer()

		var query = conn.query('UPDATE monan SET hinhanh=? WHERE id=?',
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

module.exports = {
	getAllMonAn: getAllMonAn,
	themMonAn: themMonAn,
	getMonAnById: getMonAnById,
	updateMonAn: updateMonAn,
	deleteMonAn:deleteMonAn,
	taiAnhMonAn: taiAnhMonAn
}
