package controllers

type PreionController struct {
	BaseController
}

func (self *PreionController) List() {
	self.Data["pageTitle"] = "订单管理"
	self.display()
}

func (self *PreionController) Table() {
}
