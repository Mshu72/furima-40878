require 'rails_helper'

RSpec.describe OrderReceiver, type: :model do

  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_receiver = FactoryBot.build(:order_receiver, item_id: item.id, user_id: user.id)
  end

  describe '商品購入' do

    context '商品購入ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_receiver).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @order_receiver.building = ''
        expect(@order_receiver).to be_valid
      end
      
    end

    context '商品購入ができないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_receiver.postal_code = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Postal codeを入力してください")
      end

      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_receiver.postal_code = '1234567'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Postal codeは「3桁ハイフン4桁」の半角文字列で入力してください")
      end

      it 'prefectureが1だと保存できないこと' do
        @order_receiver.prefecture = 1
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Prefectureを入力してください")
      end

      it 'cityが空だと保存できないこと' do
        @order_receiver.city = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Cityを入力してください")
      end

      it 'addressが空だと保存できないこと' do
        @order_receiver.address = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Addressを入力してください")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_receiver.phone_number = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone numberを入力してください")
      end

      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_receiver.phone_number = '090123456'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone numberは10桁以上11桁以内の半角数値で入力してください")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_receiver.phone_number = '090123456789'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone numberは10桁以上11桁以内の半角数値で入力してください")
      end

      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        @order_receiver.phone_number = '090-1234-5678'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone numberは10桁以上11桁以内の半角数値で入力してください")
      end

      it 'tokenが空だと保存できないこと' do
        @order_receiver.token = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Tokenを入力してください")
      end

      it 'item_idが空だと保存できないこと' do
        @order_receiver.item_id = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Itemを入力してください")
      end

      it 'user_idが空だと保存できないこと' do
        @order_receiver.user_id = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end