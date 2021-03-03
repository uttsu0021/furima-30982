class BuyAddress
   include ActiveModel::Model
   attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building, :phone,:item_id,:user_id,:buy_id
   
   with_options presence: true do
     validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "code can't be blank" }
     validates :municipality
     validates :address
     validates :phone, format: {with: /\A\d{11}\z/, message: "number can't be blank" }
   end

   validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building: building, phone: phone, buy_id: buys.id)
   end
end