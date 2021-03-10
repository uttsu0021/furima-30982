require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end
  describe '商品購入情報の保存' do
    context '商品が購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idが選択していないと保存できないこと' do
        @buy_address.shipping_area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @buy_address.phone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは半角数字以外だと保存できないこと' do
        @buy_address.phone = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空では登録できないこと' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it '電話番号は英数字混合では保存できないこと' do
        @buy_address.phone = '090aaaa1234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number Input only number")
      end
      it ' 電話番号は12桁以上では保存できないこと' do
        @buy_address.phone = '09012345678912'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end