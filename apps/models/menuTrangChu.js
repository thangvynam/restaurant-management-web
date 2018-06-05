var q = require('q')  
var db = require('../common/database')

var conn = db.getConnection()

function getAllMenuTC(){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM menutrangchu', (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}

module.exports = {
	getAllMenuTC: getAllMenuTC
}