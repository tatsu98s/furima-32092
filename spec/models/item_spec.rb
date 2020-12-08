require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまく行く時' do
      it '空欄がなければ出品できる' do
        expect(@item).to be_valid
      end
    end



    context '出品がうまくいかないいとき' do
      it "商品画像が無いと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が無いと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品説明が無いと出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーが選択されていないと出品できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it "'---'が選択されていると出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態が選択されていないと出品できない" do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end

      it "'---'が選択されていると出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end


      it "配送料の負担が選択されていないと出品できない" do
        @item.shipping = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank", "Shipping is not a number")
      end

      it "'---'が選択されていると出品できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end


      it "発送元の地域が選択されていないと出品できない" do
        @item.area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it "'---'が選択されていると出品できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end


      it "発送までの日数が選択されていないと出品できない" do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end

      it "'---'が選択されていると出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it "商品の値段が空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "商品の値段が299円だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "商品の値段が10000000円だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end