package controllers

type MedicineController struct {
	BaseController
}

func (self *MedicineController) List() {
	self.Data["pageTitle"] = "药品管理"
	self.display()
}

func (self *MedicineController) Table() {
}
