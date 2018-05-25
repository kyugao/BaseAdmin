package outlet

import (
	"testing"
	_ "gitee.com/taotechip/components/db"
	"gopkg.in/mgo.v2/bson"
	"gitee.com/taotechip/components/db"
	"log"
)

var medicines []*Medicine
var medicine *Medicine
var contacts []*ContactInfo

func init() {
	medicine = &Medicine{}
	colMedicine := db.GetCollection(medicine)
	err := colMedicine.Find(bson.M{}).Limit(20).All(&medicines)
	if err != nil {
		log.Printf("query medicine data error %v.", err)
	}

	colContact := db.GetCollection(&ContactInfo{})
	colContact.Find(bson.M{}).All(&contacts)
	if err != nil {
		log.Printf("query contacts data error %v.", err)
	}
}

func TestCreateOrder(t *testing.T) {
	for i := 0; i < 10; i ++ {
		medicineItems := make([]*MedicineItem, 3)

		medicineItems[0] = &MedicineItem{
			RefMedicine: db.GetDBRef(medicine, medicines[1].Id),
			Count:       3,
		}
		medicineItems[1] = &MedicineItem{
			RefMedicine: db.GetDBRef(medicine, medicines[3].Id),
			Count:       6,
		}
		medicineItems[2] = &MedicineItem{
			RefMedicine: db.GetDBRef(medicine, medicines[8].Id),
			Count:       4,
		}
		record := &OrderRecord{
			Id:           bson.NewObjectId(),
			MedicineList: medicineItems,
			OrderTotal:   5980,
			OrderFreight: 800,
		}

		db.GetCollection(&OrderRecord{}).Insert(record)

	}
}
