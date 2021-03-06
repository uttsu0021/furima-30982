class BuyAddress
   include ActiveModel::Model
   attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building, :phone,:item_id,:user_id,:buy_id
   
   with_options presence: true do
     validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
     validates :municipality
     validates :address
     validates :phone, format: {with: /\A\d{11}\z/, message: "Phone number Input only number" }
   end

   validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building: building, phone: phone, buy_id: buys.id)
   end
end