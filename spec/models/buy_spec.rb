require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  describe '商品購入機能' do
    context '購入がうまく行える時' do
      it 'zip_code, area_id, city, addoress, phone_number, が入力されている時' do
        expect(@buy).to be_valid
      end

      it '建物名がなくても登録できる' do
        @buy.buildeing_name = ''
        expect(@buy).to be_valid
      end
    end

    context '購入がうまく行えない時' do
      it '郵便番号が空だと登録できない' do
        @buy.zip_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Zip code can't be blank ")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと登録できない' do
        @buy.zip_code = '1234567'
        @buy.valid?
        # binding.pry
        expect(@buy.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと登録できない' do
        @buy.area_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("AreaId can't be blank")
      end

      it '市区町村が空だと登録できない' do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @buy.addoress = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Addoress can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("PhoneNumber cant't be blank")
      end

      it '電話番号がハイフンを含まない正しい形式でないと登録できない' do
        @buy.phone_number = '09012345678'
        @buy.valid?
        # binding.pry
        expect(@buy.errors.full_messages).to include("PhoneNumber can't be blank")
      end
    end
  end
end
