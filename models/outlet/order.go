package outlet

import (
	"gopkg.in/mgo.v2/bson"
	"gopkg.in/mgo.v2"
)

type ContactInfo struct {
	Id                 bson.ObjectId `bson:"_id"`
	Name               string
	PhoneNumber        string
	Province           string
	City               string
	District           string
	Address            string
	CompleteAddress    string
	DistributionMethod string
}

func (m *ContactInfo) ColName() string {
	return "ContactInfo"
}

type MedicineItem struct {
	RefMedicine *mgo.DBRef
	Count       int
}

type OrderRecord struct {
	Id           bson.ObjectId `bson:"_id"`
	OrderNumber  string
	MedicineList []*MedicineItem
	Contact      *mgo.DBRef
	OrderTotal   int64
	OrderFreight int64
}

func (m *OrderRecord) ColName() string {
	return "OrderRecord"
}
