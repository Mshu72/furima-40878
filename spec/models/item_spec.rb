require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる場合' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'タイトルが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Titleを入力してください")
      end

      it '詳細が空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detailを入力してください")
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end

      it '価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
      end

      it '価格が10,000,000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end

      it '価格が全角数字では出品できない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '価格が半角英字では出品できない' do
        @item.price = 'asdf'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '価格が全角では出品できない' do
        @item.price = 'かかく'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end

      it 'カテゴリーIDが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categorycan't be blank")
      end

      it '都道府県IDが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecturecan't be blank")
      end

      it '配送費IDが1では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping feecan't be blank")
      end

      it '配送予定IDが1では出品できない' do
        @item.delivery_scheduled_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery scheduledcan't be blank")
      end

      it 'ステータスIDが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Statuscan't be blank")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        expect(@item).to_not be_valid
        expect(@item.errors[:user]).to include("を入力してください")
      end
    end
  end
end