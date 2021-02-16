require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品データの保存' do
    context '保存できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end
    context '保存できない時' do
      it 'productが空だと保存できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'explanationが空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryを選択していないと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'conditionを選択していないと保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'を選択していないと保存できないこと' do
        @item.shipping_charge_id = 1

        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end
      it 'を選択していないと保存できないこと' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area Select')
      end
      it 'を選択していないと保存できないこと' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end
      it 'priceが半角数字以外だと保存できないこと' do
        @item.price = '２００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = 'aa500'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item.price = 10_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
