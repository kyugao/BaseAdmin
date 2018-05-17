package main

import (
	"BaseAdmin/models"
	_ "BaseAdmin/routers"

	"BaseAdmin/astaxie/beego"
)

func main() {
	models.Init()
	beego.Run()
}
