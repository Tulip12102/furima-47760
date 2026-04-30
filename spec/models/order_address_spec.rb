require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address, user_id: 1, item_id: 1)
    @order_address.token = 'tok_abcdefghijk00000000000000000'
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
    end
    context '保存できない場合' do
      it 'tokenが空では保存ができないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存ができないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角では保存ができないこと' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角ハイフンなしでは保存ができないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角文字列では保存ができないこと' do
        @order_address.postal_code = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_idが1では保存ができないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存ができないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空では保存ができないこと' do
        @order_address.address_line = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numberが空では保存ができないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字では保存できないこと' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input only number')
      end
      it 'phone_numberが半角文字列では保存できないこと' do
        @order_address.phone_number = 'abcdefghijk'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input only number')
      end
      it 'phone_numberにハイフンが含まれていては保存できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid.Input only number')
      end
      it 'user_idが空では保存ができないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存ができないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
