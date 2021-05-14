require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "購入情報の保存" do
    before do
      @order = FactoryBot.build(:order)
    end

    it '全ての値を入力していると保存できる' do
      expect(@order).to be_valid
    end
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
    it 'buildingは空でも保存できる' do
      @order.building = ""
      expect(@order).to be_valid
    end
  end
end