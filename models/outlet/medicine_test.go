package outlet

import (
	"testing"
	_ "gitee.com/taotechip/components/db"
	"gitee.com/taotechip/components/db"
	"github.com/360EntSecGroup-Skylar/excelize"
	"fmt"
	"gitee.com/taotechip/components/util/gyjson"
	"strconv"
	"log"
	"gopkg.in/mgo.v2/bson"
)

func TestInitMedicine(t *testing.T) {
	file, err := excelize.OpenFile("./conf/td_haiwang.xlsx")
	if err != nil {
		panic(err)
		return
	}
	values := file.GetRows("data")
	fmt.Println(gyjson.ToJsonString(values))

	col := db.GetCollection(&Medicine{})
	col.RemoveAll(nil)

	for i := 1; i < len(values); i ++ {
		price, err := strconv.ParseFloat(values[i][3], 32)
		if err != nil {
			log.Print("parse price error %v, input %s.", values[i][3])
			continue
		}
		item := &Medicine{
			Id:               bson.NewObjectId(),
			ProductVariantId: values[i][0],
			Name:             values[i][1],
			Sku:              values[i][2],
			Price:            int64(price * 100),
		}

		col.Insert(item)
	}
}
