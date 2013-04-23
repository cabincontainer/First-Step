#encoding: utf-8

# Admins, religious influential people
admin = FactoryGirl.create(:user, name: "Dalai Lama Admin", password: "dalai", email: "dalai@example.com")

#Container
container_category = FactoryGirl.create(:category, name: "คอนเทนเนอร์")
container = FactoryGirl.create(:product,
  name: "คอนเทนเนอร์สำนักงานเคลื่อนที่",
  code: "C01",
  specifications: {"0"=>{"field"=>"กว้าง x ยาว x สูง", "value"=>"2 x 6 x 2 (เมตร)"}, "1"=>{"field"=>"น้ำหนัก", "value"=>"200 (กิโลกรัม)"}, "2"=>{"field"=>"สี", "value"=>"เทา"}},
  category: container_category
)

#Guardroom
guardroom_category = FactoryGirl.create(:category, name: "ป้อมยามสำเร็จรูป")
guardroom = FactoryGirl.create(:product,
  name: "ป้อมยามขนาดเล็ก",
  code: "G01",
  specifications: {"0"=>{"field"=>"กว้าง x ยาว x สูง", "value"=>"1.5 x 1.5 x 2.5 (เมตร)"}, "1"=>{"field"=>"สี", "value"=>"เทา"}},
  category: guardroom_category
)

#Restroom
restroom_category = FactoryGirl.create(:category, name: "ห้องน้ำสำเร็จรูป")
restroom = FactoryGirl.create(:product,
  name: "ห้องน้ำขนาดเล็ก",
  code: "R01",
  specifications: {"0"=>{"field"=>"กว้าง x ยาว x สูง", "value"=>"1 x 1 x 2 (เมตร)"}, "1"=>{"field"=>"สี", "value"=>"ขาว - น้ำเงิน"}},
  category: restroom_category
)
