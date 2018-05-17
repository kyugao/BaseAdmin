package routers

import (
	"BaseAdmin/astaxie/beego"
	"BaseAdmin/controllers/core"
)

func init() {
	// 默认登录
	beego.Router("/login", &core.LoginController{}, "*:LoginIn")
	beego.Router("/login_out", &core.LoginController{}, "*:LoginOut")
	beego.Router("/no_auth", &core.LoginController{}, "*:NoAuth")

	beego.Router("/home", &core.HomeController{}, "*:Index")
	beego.Router("/home/start", &core.HomeController{}, "*:Start")

	beego.AutoRouter(&core.AuthController{})
	beego.AutoRouter(&core.RoleController{})
	beego.AutoRouter(&core.AdminController{})
	beego.AutoRouter(&core.UserController{})

}
