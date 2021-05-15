require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '商品が購入できる時' do
      it '全ての値を入力していると保存できる' do
        expect(@order).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'postal_codeが空だと保存できない' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'delivery_areaが空だと保存できない' do
        @order.delivery_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'j_sityosonが空だと保存できない' do
        @order.j_sityoson = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("J sityoson can't be blank")
      end
      it 'j_bantiが空だと保存できない' do
        @order.j_banti = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("J banti can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号は10桁以下では保存できない' do
        @order.phone_number = "012345678"
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '12桁以上では登録できないこと' do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid"  )
      end
      it '電話番号が英数では登録できないこと' do
        @order.phone_number = "0901234aaaa"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number", "Phone number is invalid")
      end
    end
  end
end