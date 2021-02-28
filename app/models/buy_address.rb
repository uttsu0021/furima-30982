class BuyAddress
   include ActiveModel::Model
   attr_accessor :postal_code, :shipping_area, :municipality, :address, :building, :phone,:current_user.id, :item.id,:token 
   
   with_options presene: true do
     validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, "code can't be blank"}
     validates :municipality
     validates :address
     validates :phone, format: {with: /\A\d{11}\z/, "number can't be blank"}
   end

   validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
    Buy.create(user_id: current_user.id, item_id: item.id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building: building, phone: phone, buy_id: buy.id)
   end
end