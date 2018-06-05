var q = require('q')  
var db = require('../common/database')

var conn = db.getConnection()

function getHeaderById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM header WHERE ?',{id:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}


function updateHeader(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE header SET fb=?, mail=?, sdt=?, time=? WHERE id=?',
			[params.fb, params.mail, params.sdt, params.time, params.id], (err, result)=>{
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
	getHeaderById: getHeaderById,
	updateHeader: updateHeader
}