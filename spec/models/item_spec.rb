require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.save
    @item = FactoryBot.build(:item, user: @user)
  end

  context '新規登録ができるとき' do
    it '全ての情報があれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が投稿できない時' do
    it 'nameがないと投稿できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'how_itemがないと投稿できない' do
      @item.how_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("How item can't be blank")
    end

    it 'category_idがないと投稿できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'status_idがないと投稿できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it 'delivery_fee_idがないと投稿できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end

    it 'delivery_area_idがないと投稿できない' do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
    end

    it 'send_day_idがないと投稿できない' do
      @item.send_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Send day must be other than 1')
    end

    it 'feeがないと投稿できない' do
      @item.fee = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end

    it 'feeが半角数字以外だと投稿できない' do
      @item.fee = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee is not a number')
    end

    it 'feeが半角英数混合だと投稿できない' do
      @item.fee = 'aaa1111'
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee is not a number')
    end

    it 'feeが半角英字のみだと投稿できない' do
      @item.fee = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee is not a number')
    end

    it 'feeが300未満だと投稿できない' do
      @item.fee = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee must be greater than 299')
    end

    it 'feeが9,999,999を超えると投稿できない' do
      @item.fee = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee must be less than 10000000')
    end

    it '画像が１枚ないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
