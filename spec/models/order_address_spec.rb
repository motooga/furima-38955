require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it "すべての情報が埋まっていれば保存できる" do
      end
    end

    context '内容に問題がある場合' do
      it '' do
      end
    end
  end
end