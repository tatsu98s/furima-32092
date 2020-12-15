require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep 1
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品の購入ができる' do
      it '必要な情報を入力すると購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号に"-"がないと購入できない' do
        @order.postal_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it '都道府県が"---"だと購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '市町村が空だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank", 'Tel input only number')
      end

      it '電話番号に"-"が入っていると購入できない' do
        @order.tel = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel input only number')
      end

      it '電話番号が12桁以上だと購入できない' do
        @order.tel = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel input only number')
      end

      it '「user_id」が空だと購入できないが空だと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it '「item_id」が空だと購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
