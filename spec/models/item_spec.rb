require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規投稿' do
    context '新規投稿できるとき' do
      it 'すべての必須項目を入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品名が40文字以上だと登録できない' do
        @item.item_name = Faker::Lorem.paragraph(sentence_count: 20) 
          while @item.item_name.length < 40
            @item.item_name = Faker::Lorem.paragraph(sentence_count: 20)
          end
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it '商品説明が空だと登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it '商品説明が1000文字以上だと登録できない' do
        @item.item_info  = Faker::Lorem.paragraph(sentence_count: 100)
        while @item.item_info.length < 1000
          @item.item_info = Faker::Lorem.paragraph(sentence_count: 100)
        end        
        @item.valid?
        expect(@item.errors.full_messages).to include('Item info is too long (maximum is 1000 characters)')
      end

      it 'item_category_idが1だと登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end

      it 'item_sales_status_idが1だと登録できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item sales status must be other than 1')
      end

      it 'item_shipping_fee_status_idが1だと登録できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item shipping fee status must be other than 1')
      end

      it 'item_prefecture_idが1だと登録できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item prefecture must be other than 1')
      end

      it 'item_scheduled_delivery_idが1だと登録できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item scheduled delivery must be other than 1')
      end

      it '販売価格が空だと登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '販売価格に小数点が含まれていると登録できない' do
        @item.item_price = '300.50'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be an integer")
      end

      it '販売価格が300以下だと登録できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it '販売価格が全角だと登録できない' do
        @item.item_price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格が9999999以上だと登録できない' do
        @item.item_price = 9_999_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
    
      end
    end

  end
end
