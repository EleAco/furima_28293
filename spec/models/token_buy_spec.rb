require 'rails_helper'

RSpec.describe TokenBuy, type: :model do
  before do
    @tokenbuy = FactoryBot.build(:token_buy)
  end

  describe '商品購入機能' do
    context '購入がうまく行える時' do
      it 'zip_code, area_id, city, addoress, phone_number, が入力されている時' do
        expect(@tokenbuy).to be_valid
      end

      it '建物名がなくても登録できる' do
        @tokenbuy.building_name = ''
        expect(@tokenbuy).to be_valid
      end
    end

    context '購入がうまく行えない時' do
      it '郵便番号が空だと登録できない' do
        @tokenbuy.zip_code = nil
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと登録できない' do
        @tokenbuy.zip_code = '1234567'
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include('Zip code is invalid')
      end

      it '都道府県が空だと登録できない' do
        @tokenbuy.area_id = nil
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include('Area is not a number')
      end

      it '市区町村が空だと登録できない' do
        @tokenbuy.city = ''
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @tokenbuy.addoress = ''
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include("Addoress can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @tokenbuy.phone_number = ''
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号がハイフンを含まない正しい形式でないと登録できない' do
        @tokenbuy.phone_number = '090-1234-5678'
        @tokenbuy.valid?
        expect(@tokenbuy.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
