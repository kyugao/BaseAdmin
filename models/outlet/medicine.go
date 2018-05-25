package outlet

import (
	"gopkg.in/mgo.v2/bson"
)

type Medicine struct {
	Id               bson.ObjectId `bson:"_id"`
	ProductVariantId string
	Name             string
	Sku              string
	Price            int64
}

func (m *Medicine) ColName() string {
	return "Medicine"
}
