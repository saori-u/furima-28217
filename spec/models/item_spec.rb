require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/output-image1.png')
  end


  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "image、name、text、category_id、condition_id、postage_id、prefecture_id、day_id、priceがあれば商品は出品される" do
        expect(@item).to be_valid
      end
      it "priceが半角入力の時" do
        @item.price = 1111
        expect(@item).to be_valid
      end


    end
    context "商品の出品ができない場合" do

# 空白関係のテスト
      it "imageがないと商品は出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "nameがないと商品は出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end 
      it "textがないと商品は出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end 

      it "category_idが【1】だと商品は出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end 
      it "condition_idが【1】だと出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end 
      it "postage_idが【1】だと出品できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end 
      it "prefecture_idが【1】だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end 
      it "day_idが【1】だと出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end 
      it "priceがないと商品は出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
# 空白関係のテストおわり
# アソシエーションのテスト
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
# アソシエーションのテスト終わり

# 価格範囲、文字入力のテスト
      it "priceが300円以下だと商品は出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it "priceが10000000円以上だと商品は出品できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end 
      it "priceが全角数字だと商品は出品できない" do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it "priceがひらがなだと商品は出品できない" do
        @item.price = "あああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 

# 価格範囲のテスト終わり


    end
  end
end