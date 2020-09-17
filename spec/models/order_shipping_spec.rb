require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入情報の保存' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping).to be_valid
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_shipping.postal_code = '1234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_shipping.prefecture_id = 0
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'building_nameは空でも保存できること' do
      @order_shipping.building_name = nil
      expect(@order_shipping).to be_valid
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @order_shipping.phone_number = '２０００'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_shipping.phone_number = '012345678912'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end
