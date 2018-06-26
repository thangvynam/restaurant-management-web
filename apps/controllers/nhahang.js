var express = require('express')
var multer = require('multer')
var ejs = require('ejs')
var path = require('path')


var router = express.Router()

//Khai bao bien
var user_md = require("../models/user")
var monan_md= require("../models/monan")
var header_md= require("../models/header")
var slides_md= require("../models/slides")



router.get("/monan/:id",(req,res)=>{
	var params = req.params
	var id = params.id

	var data = monan_md.getMonAnById(id)

	//Header
	var header = header_md.getHeaderById(1)
	var header1=""
	header.then((posts)=>{
			var post = posts[0]
			header1 = {
				post: post,
				error:false
			}
	})



	if(data){
		data.then((posts)=>{
			var post = posts[0]
			var data = {
				post: post,
				error:false
			}

			res.render("nhahang/motmonan",{data:data,header:header1})
		}).catch((err)=>{
			var data = {error:"Could not get monan by ID"}
			res.render("nhahang/motmonan",{data:data,header:header1})
		})
	}else{
		var data = {error:"Could not get monan by ID"}
		res.render("nhahang/motmonan",{data:data,header:header1})
	}
})


module.exports=router