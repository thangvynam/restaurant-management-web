var q = require('q')  
var db = require('../common/database')

var conn = db.getConnection()

function getAllSlide(){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM slides', (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}

function getSlidesById(id){
	var defer = q.defer()

	var query = conn.query('SELECT * FROM slides WHERE ?',{id:id}, (err, result)=>{
		if(err){
			defer.reject(err)
		}else{
			defer.resolve(result)
		}
	})

	return defer.promise
}

function updateSlide(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('UPDATE slides SET title=?, content=?, button_content=?, image=? WHERE id=?',
			[params.title, params.content, params.button_content, params.image, params.id], (err, result)=>{
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

function themSlides(params){
	if(params){
		var defer = q.defer()

		var query = conn.query('INSERT INTO slides SET ?', params, (err, result)=>{
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


function deleteSlide(id){
	if(id){
		var defer = q.defer()

		var query = conn.query('DELETE FROM slides WHERE id=?',[id], (err, result)=>{
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

function taiAnhSlides(id, link){
	if(id && link){
		var defer = q.defer()

		var query = conn.query('UPDATE slides SET image=? WHERE id=?',
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
	getAllSlide: getAllSlide,
	getSlidesById: getSlidesById,
	updateSlide: updateSlide,
	themSlides: themSlides,
	deleteSlide:deleteSlide,
	taiAnhSlides:taiAnhSlides
}
