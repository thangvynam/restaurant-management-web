var express = require('express')
var multer = require('multer')
var ejs = require('ejs')
var path = require('path')
var config = require('config')
var nodemailer = require('nodemailer');

//Init router
var router = express.Router()

//Khai bao bien
var helper = require("../helpers/helper")
var admin_md = require("../models/admin")
var user_md = require("../models/user")
var monan_md = require("../models/monan")
var header_md = require("../models/header")
var slides_md = require("../models/slides")
var chinhanh_md = require("../models/chinhanh")
var datban_md = require("../models/book")



//Set Storage Engine
const storage = multer.diskStorage({
    destination: './public/images/',
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

//Init Upload
const upload = multer({
    storage: storage,
    limits: { fileSize: 100000000 },
    fileFilter: (req, file, cb) => {
        checkFileType(file, cb)
    }
}).single('myImage')

//Check File Type
function checkFileType(file, cb) {
    // Allowes ext
    const filetypes = /jpeg|jpg|png|gif/
    //Check ext
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase())
    //Check mime
    const mimetype = filetypes.test(file.mimetype)

    if (mimetype && extname) {
        return cb(null, true)
    } else {
        cb('Error: Images Only')
    }
}


//--------------------------------------Đăng nhập, Đăng ký ADMIN------------------------------------------//
router.get("/admin_signup", (req, res) => {

    res.render("admin_signup", { data: {} })
})

router.post("/admin_signup", (req, res) => {
    var user = req.body

    if (user.email.trim().length == 0) {
        res.render("admin_signup", { data: { error: "Email is required" } })
    } else if (user.passwd != user.repasswd && user.passwd.trim().length != 0) {
        res.render("admin_signup", { data: { error: "Password not match" } })
    } else {
        if (user.isadmin != config.get("pass_admin")) {
            res.render("admin_signup", { data: { error: "Code not match" } })
        } else {
            //Insert to DB
            var password = helper.hash_password(user.passwd)
            user = {
                email: user.email,
                password: password,
                first_name: user.firstname,
                last_name: user.lastname,
                isadmin: "admin"
            }

            //su dung ham trong model admin_md.addAdmin(admin)

            var result = admin_md.addAdmin(user)
            result.then(function(data) {
                res.redirect("/admin/admin_signin")
            }).catch(function(err) {
                res.render("admin_signup", { data: { error: err } })
            });
        }


    }

})


router.get("/admin_signin", (req, res) => {

    res.render("admin_signin", { data: {} })
})

router.post("/admin_signin", (req, res) => {
    var param = req.body
    if (param.email.trim().length == 0) {
        res.render("admin_signin", { data: { error: "Please enter an email" } })
    } else {


        var data = admin_md.getAdminByEmail(param.email)
        if (data) {
            data.then((users) => {
                var user = users[0]
                // var pass = param.password

                var status = helper.compare_password(param.password, user.password)
                if (!status) {
                    res.render("admin_signin", { data: { error: "Password wrong" } })
                } else {
                    if (req.session.user) {
                        req.session.destroy((err) => {
                            helper.set_TEMP(0)
                            helper.set_ID(-1)
                            if (err) { console.log("FAILED") } else { console.log("SUCCESS") }
                        })
                    }
                    req.session.admin = user
                    helper.set_TEMP(1)
                    helper.set_ID(user.id)
                    res.redirect("/")
                    //-----------------------------Render------------------------

                }

            }).catch((err) => {
                res.render("admin_signin", { data: { error: "User not exists" } })
            })
        } else {
            res.render("admin_signin", { data: { error: "User not exists" } })
        }
    }

})



//--------------------------------------Đăng nhập, Đăng ký USER------------------------------------------//
router.get("/signup", (req, res) => {

    res.render("signup", { data: {} })
})

// router.post("/signup",(req,res)=>{
// 	var user = req.body

// 	if(user.email.trim().length==0){
// 		res.render("signup",{data:{error:"Email is required"}})
// 	}

// 	else if(user.passwd != user.repasswd && user.passwd.trim().length != 0){
// 		res.render("signup",{data:{error:"Password not match"}})	
// 	}
// 	else{	
// 		//Insert to DB
// 		var password = helper.hash_password(user.passwd)
// 		user={
// 			email: user.email,
// 			password: password,
// 			first_name: user.firstname,
// 			last_name: user.lastname
// 		}

// 		//su dung ham trong model user_md.addUser(user)

// 		var result = user_md.addUser(user)                      
// 		result.then(function(data){
// 		res.redirect("/admin/signin")       
// 		}).catch(function(err){
// 		res.render("signup",{data: {error: err}})
// 		});		
//     }

// })

var signupInfo = {
    email: '',
    password: '',
    first_name: '',
    last_name: ''
}
var code = ""
router.post("/signup", (req, res) => {
    var user = req.body

    if (user.email.trim().length == 0) {
        res.render("signup", { data: { error: "Email is required" } })
    } else if (user.passwd != user.repasswd && user.passwd.trim().length != 0) {
        res.render("signup", { data: { error: "Password not match" } })
    } else {
        var code1 = Math.floor((Math.random() * 50000) + 10000)
        code = code1
        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: config.get("gmail.username"), //config
                pass: config.get("gmail.pass") //config
            }
        });

        var mailOptions = {
            from: config.get("gmail.username"), //config
            to: user.email, //signup
            subject: 'Mã xác nhận ',
            text: `👻Code: ${code1}`
        };

        transporter.sendMail(mailOptions, function(error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });

        var password = helper.hash_password(user.passwd)
        var data = {
            email: user.email,
            password: password,
            first_name: user.firstname,
            last_name: user.lastname,
            code1: code1
        }

        signupInfo = {
            email: user.email,
            password: password,
            first_name: user.firstname,
            last_name: user.lastname
        }
        res.render("code", { data: data })
    }

})

router.post("/signup/code", (req, res) => {
    var user = req.body

    if (user.pass != code) {
        res.render("code", { data: { error: "Code không hợp lệ" } })

    } else {
        var result = user_md.addUser(signupInfo)
        result.then(function(data) {
            res.redirect("/admin/signin")
        }).catch(function(err) {
            res.render("code", { data: { error: err } })
        });
    }

})

// router.post("/signup/code1",(req,res)=>{

// }


router.get("/signin", (req, res) => {

    res.render("signin", { data: {} })
})

router.post("/signin", (req, res) => {

    var param = req.body
    if (param.email.trim().length == 0) {
        res.render("signin", { data: { error: "Please enter an email" } })
    } else {

        var data = user_md.getUserByEmail(param.email)
        if (data) {
            data.then((users) => {
                var user = users[0]
                // var pass = param.password
                var status = helper.compare_password(param.password, user.password)
                if (!status) {
                    res.render("signin", { data: { error: "Password wrong" } })
                } else {
                    req.session.user = user
                    if (req.session.admin) {
                        helper.set_TEMP(0)
                        helper.set_ID(-1)
                        req.session.destroy((err) => {
                            if (err) { console.log("FAILED") } else { console.log("SUCCESS") }
                        })
                    }
                    // config.set("temp") = true
                    helper.set_TEMP(1)
                    helper.set_ID(user.id)
                    res.redirect("/")
                }
            }).catch((err) => {
                res.render("signin", { data: { error: "User not exists" } })
            })
        } else {
            res.render("signin", { data: { error: "User not exists" } })
        }
    }

})

router.get("/code", (req, res) => {
    res.render("admin/xuly/admin_code")
})



//----------------------------------------------Users----------------------------------------------//

// const Check = ""
// function KiemTraDangNhap(){
// 	if(Check === "ledinhphu"){
// 		return true
// 	}
// 	return false
// }

// router.post("/code",(req,res)=>{
// 	var param = req.body
// 	Check = param.pass
// })

router.get("/users", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })

        var data = user_md.getAllUser()
        data.then((user) => {
            var data = {
                user: user,
                error: false
            }
            res.render("admin/xuly/users", { data: data, header: header1 })
        }).catch((err) => {
            var data = { error: "Could not get Users" }
            res.render("admin/xuly/users", { data: data, header: header1 })
        })
    } else {
        res.redirect("/admin/admin_signin")
    }

})



//-----------------------------------------------Mon An--------------------------------------------//
router.get("/", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        header.then((posts) => {
            var post = posts[0]
            var header = {
                post: post,
                error: false
            }
            // res.render("admin/xuly/header",{data:data, header:data})
            res.render("admin/admin", { data: { error: false }, header: header })
        })
    } else {
        res.redirect("/admin/admin_signin")
    }


})

router.get("/monan", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })

        var data = monan_md.getAllMonAn()

        data.then((cacmonan) => {
            var data = {
                cacmonan: cacmonan,
                error: false
            }
            res.render("admin/xuly/monan", { data: data, header: header1 })
        }).catch((err) => {
            res.render("admin/xuly/monan", { data: { error: "Get Post data is error" }, header: header1 })
        })
    } else {
        res.redirect("/admin/admin_signin")
    }

})



router.get("/monan/themmonan", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })
        res.render("admin/xuly/themmonan.ejs", {
            data: { error: false },
            header: header1,
            anhmonan: "",
            msg: ""
        })
    } else {
        res.redirect("/admin/admin_signin")
    }

})



router.post("/monan/themmonan", (req, res) => {
    params = req.body

    if (params.ten.trim().length == 0) {
        var data = {
            error: "Tên món ăn không được trống"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else if (params.nguyenlieu.trim().length == 0) {
        var data = {
            error: "Nguyên liệu món ăn không được trống"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else if (params.gia.trim().length == 0) {
        var data = {
            error: "Giá tiền món ăn không được trống"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else if (params.hinhanh.trim().length == 0) {
        var data = {
            error: "Bạn cần thêm ảnh cho món ăn"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else if (params.gioithieu.trim().length == 0) {
        var data = {
            error: "Bạn cần thêm mô tả cho món ăn"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else if (params.bua.trim().length == 0) {
        var data = {
            error: "Bạn cần thêm loại cho món ăn"
        }
        res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
    } else {
        params = {
            ten: params.ten,
            gia: params.gia,
            nguyenlieu: params.nguyenlieu,
            hinhanh: params.hinhanh,
            gioithieu: params.gioithieu,
            bua: params.bua
        }

        var data = monan_md.themMonAn(params);
        data.then((result) => {
            res.redirect("/admin/monan")
        }).catch((err) => {
            var data = {
                error: "Could not insert MonAn"
            }
            res.render("admin/xuly/themmonan", { data: data, anhmonan: "", msg: "" })
        })
    }
})

router.post("/monan/themmonan/themanh", (req, res) => {
    upload(req, res, (err) => {
        if (err) {
            res.render('admin/xuly/themmonan', {
                data: { error: false },
                anhmonan: "",
                msg: err

            })
        } else {
            if (req.file == undefined) {
                res.render('admin/xuly/themmonan', {
                    data: { error: false },
                    anhmonan: "",
                    msg: 'ERROR: No File Selected'

                })
            } else {
                //Them Anh vao DB

                console.log(req.file)
                console.log(req.file.path)
                res.render('admin/xuly/themmonan', {
                    anhmonan: `/static/images/${req.file.filename}`,

                    data: { error: false },
                    msg: 'File Uploaded',
                    file: `/static/images/${req.file.filename}`
                })
            }
        }
    })
})



router.get("/monan/suamonan/:id", (req, res) => {
    if (req.session.admin) {
        var params = req.params
        var id = params.id

        var data = monan_md.getMonAnById(id)

        if (data) {
            data.then((posts) => {
                var post = posts[0]
                var data = {
                    post: post,
                    error: false
                }

                res.render("admin/xuly/suamonan", { data: data })
            }).catch((err) => {
                var data = { error: "Could not get Mon An by ID" }
                res.render("admin/xuly/suamonan", { data: data })
            })
        } else {
            var data = { error: "Could not get Mon An by ID" }
            res.render("admin/xuly/suamonan", { data: data })
        }
    } else {
        res.redirect("/admin/admin_signin")
    }

})

router.put("/monan/suamonan", (req, res) => {

    var params = req.body
    data = monan_md.updateMonAn(params)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})

router.get("/monan/taianh/:id", (req, res) => {
    if (req.session.admin) {
        var params = req.params
        var id = params.id
        res.render("admin/xuly/taianh", { id: id, msg: "" })
    } else {
        res.redirect("/admin/admin_signin")
    }
})

router.post("/monan/taianh/:id", (req, res) => {
    var params = req.params
    var id = params.id
    upload(req, res, (err) => {
        if (err) {
            res.render(`admin/xuly/taianh`, {
                id: id,
                anhmonan: "",
                msg: err
            })
        } else {
            if (req.file == undefined) {
                res.render(`admin/xuly/taianh`, {
                    id: id,
                    anhmonan: "",
                    msg: 'ERROR: No File Selected'
                })
            } else {
                //Them Anh vao DB
                // console.log(id)	
                // console.log(req.file)
                // console.log(req.file.path)

                var data = monan_md.taiAnhMonAn(id, `/static/images/${req.file.filename}`)
                data.then((result) => {
                    res.redirect("/admin/monan")
                }).catch((err) => {
                    res.render(`admin/xuly/taianh`, {
                        id: id,
                        anhmonan: `/static/images/${req.file.filename}`,
                        msg: 'File Uploaded',
                        file: `/static/images/${req.file.filename}`
                    })
                })
            }
        }
    })
})



router.delete("/monan/delete", (req, res) => {
    var monan_id = req.body.id
    var data = monan_md.deleteMonAn(monan_id)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})


//--------------------------------------------Header-----------------------------------------------------
router.get("/header/:id", (req, res) => {
    if (req.session.admin) {
        var params = req.params
        var id = params.id

        var data = header_md.getHeaderById(id)

        if (data) {
            data.then((posts) => {
                var post = posts[0]
                var data = {
                    post: post,
                    error: false
                }

                res.render("admin/xuly/header", { data: data })
            }).catch((err) => {
                var data = { error: "Could not get Header by ID" }
                res.render("admin/xuly/header", { data: data })

            })
        } else {
            var data = { error: "Could not get Header by ID" }
            res.render("admin/xuly/header", { data: data })
        }
    } else {
        res.redirect("/admin/admin_signin")
    }

})


router.put("/header", (req, res) => {
    var params = req.body
    data = header_md.updateHeader(params)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})

//--------------------------SLIDES----------------------------------

router.get("/slides", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })
        var data = slides_md.getAllSlide()
        data.then((slides) => {
            var data = {
                slides: slides,
                error: false
            }
            res.render("admin/xuly/slides", { data: data, header: header1 })
        }).catch((err) => {
            res.render("admin/xuly/slides", { data: { error: "Get Post data is error" }, header: header1 })
        })
    } else {
        res.redirect("/admin/admin_signin")
    }

})


router.get("/slides/suaslides/:id", (req, res) => {
    if (req.session.admin) {
        var params = req.params
        var id = params.id

        var data = slides_md.getSlidesById(id)

        if (data) {
            data.then((posts) => {
                var post = posts[0]
                var data = {
                    post: post,
                    error: false
                }

                res.render("admin/xuly/suaslides", { data: data })
            }).catch((err) => {
                var data = { error: "Could not get slide by ID" }
                res.render("admin/xuly/suaslides", { data: data })
            })
        } else {
            var data = { error: "Could not get slide by ID" }
            res.render("admin/xuly/suaslides", { data: data })
        }
    } else {
        res.redirect("/admin/admin_signin")
    }
})

router.put("/slides/suaslides", (req, res) => {
    var params = req.body

    data = slides_md.updateSlide(params)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})

router.get("/slides/themslides", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })
        res.render("admin/xuly/themslides.ejs", {
            data: { error: false },
            header: header1,
            anhslides: "",
            msg: ""
        })

    } else {
        res.redirect("/admin/admin_signin")
    }

})



router.post("/slides/themslides", (req, res) => {

    params = req.body
    if (params.title.trim().length == 0) {
        var data = {
            error: "Tiêu đề không được trống"
        }
        res.render("admin/xuly/themslides", { data: data, anhslides: "", msg: "" })
    } else if (params.content.trim().length == 0) {
        var data = {
            error: "Nội dung không được trống"
        }
        res.render("admin/xuly/themslides", { data: data, anhslides: "", msg: "" })
    } else if (params.button_content.trim().length == 0) {
        var data = {
            error: "Nội dung món ăn không được trống"
        }
        res.render("admin/xuly/themslides", { data: data, anhslides: "", msg: "" })
    } else if (params.image.trim().length == 0) {
        var data = {
            error: "Bạn cần thêm ảnh cho món ăn"
        }
        res.render("admin/xuly/themslides", { data: data, anhslides: "", msg: "" })
    } else {
        params = {
            title: params.title,
            content: params.content,
            button_content: params.button_content,
            image: params.image
        }

        var data = slides_md.themSlides(params);
        data.then((result) => {
            res.redirect("/admin/slides")
        }).catch((err) => {
            var data = {
                error: "Could not insert Slide"
            }
            res.render("admin/xuly/themslides", { data: data, anhslides: "", msg: "" })
        })
    }

})

router.post("/slides/themslides/themanh", (req, res) => {

    upload(req, res, (err) => {
        if (err) {
            res.render('admin/xuly/themslides', {
                data: { error: false },
                anhslides: "",
                msg: err

            })
        } else {
            if (req.file == undefined) {
                res.render('admin/xuly/themslides', {
                    data: { error: false },
                    anhslides: "",
                    msg: 'ERROR: No File Selected'

                })
            } else {
                //Them Anh vao DB

                console.log(req.file)
                console.log(req.file.path)
                res.render('admin/xuly/themslides', {
                    anhslides: `/static/images/${req.file.filename}`,
                    data: { error: false },
                    msg: 'File Uploaded',
                    file: `/static/images/${req.file.filename}`
                })
            }
        }
    })
})

router.delete("/slides/delete", (req, res) => {
    var slides_id = req.body.id
    var data = slides_md.deleteSlide(slides_id)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})

router.get("/slides/taianh/:id", (req, res) => {
    if (req.session.admin) {
        var params = req.params
        var id = params.id
        res.render("admin/xuly/taianh1", { id: id, msg: "" })
    } else {
        res.redirect("/admin/admin_signin")
    }

})

router.post("/slides/taianh/:id", (req, res) => {
    var params = req.params
    var id = params.id
    upload(req, res, (err) => {
        if (err) {
            res.render(`admin/xuly/taianh1`, {
                id: id,
                anhmonan: "",
                msg: err
            })
        } else {
            if (req.file == undefined) {
                res.render(`admin/xuly/taianh1`, {
                    id: id,
                    anhmonan: "",
                    msg: 'ERROR: No File Selected'
                })
            } else {
                //Them Anh vao DB
                // console.log(id)
                // console.log(req.file)
                // console.log(req.file.path)

                var data = slides_md.taiAnhSlides(id, `/static/images/${req.file.filename}`)
                data.then((result) => {
                    res.redirect("/admin/slides")
                }).catch((err) => {
                    res.render(`admin/xuly/taianh1`, {
                        id: id,
                        anhmonan: `/static/images/${req.file.filename}`,
                        msg: 'File Uploaded',
                        file: `/static/images/${req.file.filename}`
                    })
                })
            }
        }
    })
})


//--------------------------------Chi Nhánh--------------------------------------------//

router.get('/chinhanh', (req, res) => {
    var data = chinhanh_md.getAllChiNhanh()
    data.then((chinhanh) => {
        var data = {
            chinhanh: chinhanh,
            error: false
        }
        res.render("admin/xuly/chinhanh", { data: data })
    }).catch((err) => {
        res.render("admin/xuly/chinhanh", { data: { error: "Get Post data is error" } })
    })
})

router.get('/chinhanh/taianh/:id', (req, res) => {
    var params = req.params
    var id = params.id
    res.render("admin/xuly/taianh2", { id: id, msg: "" })
})


router.post("/chinhanh/taianh/:id", (req, res) => {
    var params = req.params
    var id = params.id
    upload(req, res, (err) => {
        if (err) {
            res.render(`admin/xuly/taianh2`, {
                id: id,
                anhchinhanh: "",
                msg: err
            })
        } else {
            if (req.file == undefined) {
                res.render(`admin/xuly/taianh2`, {
                    id: id,
                    anhchinhanh: "",
                    msg: 'ERROR: No File Selected'
                })
            } else {
                var data = chinhanh_md.taiAnhChiNhanh(id, `/static/images/${req.file.filename}`)
                data.then((result) => {
                    res.redirect("/admin/chinhanh")
                }).catch((err) => {
                    res.render(`admin/xuly/taianh2`, {
                        id: id,
                        anhchinhanh: `/static/images/${req.file.filename}`,
                        msg: 'File Uploaded',
                        file: `/static/images/${req.file.filename}`
                    })
                })
            }
        }
    })
})

router.get("/chinhanh/suachinhanh/:id", (req, res) => {
    var params = req.params
    var id = params.id

    var data = chinhanh_md.getChiNhanhById(id)

    if (data) {
        data.then((posts) => {
            var post = posts[0]
            var data = {
                post: post,
                error: false
            }

            res.render("admin/xuly/suachinhanh", { data: data })
        }).catch((err) => {
            var data = { error: "Could not get slide by ID" }
            res.render("admin/xuly/suachinhanh", { data: data })
        })
    } else {
        var data = { error: "Could not get slide by ID" }
        res.render("admin/xuly/suachinhanh", { data: data })
    }
})

router.put("/chinhanh/suachinhanh", (req, res) => {
    var params = req.body

    data = chinhanh_md.updateChiNhanh(params)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})


router.get("/chinhanh/themchinhanh", (req, res) => {
    if (req.session.admin) {
        //Header
        var header = header_md.getHeaderById(1)
        var header1 = ""
        header.then((posts) => {
            var post = posts[0]
            header1 = {
                post: post,
                error: false
            }
        })
        res.render("admin/xuly/themchinhanh.ejs", {
            data: { error: false },
            header: header1,
            anhchinhanh: "",
            msg: ""
        })
    } else {
        res.redirect("/admin/admin_signin")
    }

})



router.post("/chinhanh/themchinhanh", (req, res) => {
    params = req.body

    if (params.ten.trim().length == 0) {
        var data = {
            error: "Tên không được trống"
        }
        res.render("admin/xuly/themchinhanh", { data: data, anhchinhanh: "", msg: "" })
    } else if (params.thongtin.trim().length == 0) {
        var data = {
            error: "Thông tin không được trống"
        }
        res.render("admin/xuly/themchinhanh", { data: data, anhchinhanh: "", msg: "" })
    } else if (params.hinhanh.trim().length == 0) {
        var data = {
            error: "Bạn cần thêm ảnh cho chi nhánh"
        }
        res.render("admin/xuly/themchinhanh", { data: data, anhchinhanh: "", msg: "" })
    } else {
        params = {
            ten: params.ten,
            thongtin: params.thongtin,
            hinhanh: params.hinhanh,
        }

        var data = chinhanh_md.themChiNhanh(params);
        data.then((result) => {
            res.redirect("/admin/chinhanh")
        }).catch((err) => {
            var data = {
                error: "Could not insert Chi Nhánh"
            }
            res.render("admin/xuly/themchinhanh", { data: data, anhchinhanh: "", msg: "" })
        })
    }
})

router.post("/chinhanh/themchinhanh/themanh", (req, res) => {
    upload(req, res, (err) => {
        if (err) {
            res.render('admin/xuly/themchinhanh', {
                data: { error: false },
                anhchinhanh: "",
                msg: err

            })
        } else {
            if (req.file == undefined) {
                res.render('admin/xuly/themchinhanh', {
                    data: { error: false },
                    anhchinhanh: "",
                    msg: 'ERROR: No File Selected'

                })
            } else {
                //Them Anh vao DB

                console.log(req.file)
                console.log(req.file.path)
                res.render('admin/xuly/themchinhanh', {
                    anhchinhanh: `/static/images/${req.file.filename}`,

                    data: { error: false },
                    msg: 'File Uploaded',
                    file: `/static/images/${req.file.filename}`
                })
            }
        }
    })
})



router.delete("/chinhanh/delete", (req, res) => {
    var chinhanh_id = req.body.id
    var data = chinhanh_md.xoaChiNhanh(chinhanh_id)

    if (!data) {
        res.json({ status_code: 500 })
    } else {
        data.then((result) => {
            res.json({ status_code: 200 })
        }).catch(function(err) {
            res.json({ status_code: 500 })
        })
    }
})

//---------------------------------------------Xem Đặt Bàn-----------------------------------------------
router.get("/datban", (req, res) => {
    var datban = datban_md.getAllDate()
    datban.then((dt) => {
        var data = {
            ds: dt,
            error: false
        }
        res.render("admin/xuly/dsdatban", { data: data })
    })
})


router.get("/datban/new", (req, res) => {
    var trangthai = []
    var datban = datban_md.getAllDate()
    datban.then((dt) => {

        for (var i = 0; i < dt.length; i++) {
            if (dt[i].confirm === null) {
                trangthai.push(dt[i])
            }

        }
        var data = {
            ds: trangthai,
            error: false
        }
        res.render("admin/xuly/dsdatban", { data: data })
    })
})

router.get("/datban/success", (req, res) => {
    var trangthai = []
    var datban = datban_md.getAllDate()
    datban.then((dt) => {

        for (var i = 0; i < dt.length; i++) {
            if (dt[i].confirm === 'confirm') {
                trangthai.push(dt[i])
            }

        }
        var data = {
            ds: trangthai,
            error: false
        }
        res.render("admin/xuly/dsdatban", { data: data })
    })
})

router.get("/datban/fail", (req, res) => {
    var trangthai = []
    var datban = datban_md.getAllDate()
    datban.then((dt) => {

        for (var i = 0; i < dt.length; i++) {
            if (dt[i].confirm === 'reject') {
                trangthai.push(dt[i])
            }

        }
        var data = {
            ds: trangthai,
            error: false
        }
        res.render("admin/xuly/dsdatban", { data: data })
    })
})

router.get("/datban/success/:id", (req, res) => {
    var id = req.params.id
    var date = datban_md.getDateById(id)
    var p = ""
    var update = ""
    var dateall = ""
    date.then((da) => {
        p = {
            id: da[0].id,
            name: da[0].name,
            mail: da[0].mail,
            phone: da[0].phone,
            date: da[0].date,
            time: da[0].time,
            person: da[0].person,
            now: da[0].now,
            confirm: 'confirm'
        }
        update = datban_md.updateDate(p)
        update.then((ll) => {
            dateall = datban_md.getAllDate()
            dateall.then((all) => {
                var data = {
                    ds: all,
                    error: false
                }
                res.render("admin/xuly/dsdatban", { data: data })
            })

        })
    })
})

router.get("/datban/failed/:id", (req, res) => {
    var id = req.params.id
    var date = datban_md.getDateById(id)
    var p = ""
    var update = ""
    var dateall = ""
    date.then((da) => {
        p = {
            id: da[0].id,
            name: da[0].name,
            mail: da[0].mail,
            phone: da[0].phone,
            date: da[0].date,
            time: da[0].time,
            person: da[0].person,
            now: da[0].now,
            confirm: 'reject'
        }
        update = datban_md.updateDate(p)
        update.then((ll) => {
            dateall = datban_md.getAllDate()
            dateall.then((all) => {
                var data = {
                    ds: all,
                    error: false
                }
                res.render("admin/xuly/dsdatban", { data: data })
            })

        })
    })


})


module.exports = router;