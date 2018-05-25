package outlet

import (
	"testing"
	_ "gitee.com/taotechip/components/db"
	"gopkg.in/mgo.v2/bson"
	"gitee.com/taotechip/components/db"
	"fmt"
)

func TestInitContact(t *testing.T) {
	for i := 0; i < 10; i ++ {
		contact := ContactInfo{
			Id:                 bson.NewObjectId(),
			Name:               fmt.Sprintf("Adam_%d", i),
			PhoneNumber:        "18620897889",
			Province:           "广东省",
			City:               "广州市",
			District:           "天河区",
			Address:            "华明路13号2702",
			CompleteAddress:    "广东省广州市天河区华明路13号2702",
			DistributionMethod: "货到付款",
		}

		db.GetCollection(&ContactInfo{}).Insert(contact)

	}
}
