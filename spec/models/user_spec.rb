require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'メールアドレスが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'パスワードがアルファベットだけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'パスワードが６文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'password_confiremationとpasswordが不一致では登録できない' do
        @user.password = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'last_nameに半角が含まれていると登録できない' do
        @user.last_name = '山本 '
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'last_nameに英語が含まれていると登録できない' do
        @user.last_name = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameに半角が含まれていると登録できない' do
        @user.first_name = '山本 '
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'first_nameに英語が含まれていると登録できない' do
        @user.first_name = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_name_kanaに半角が含まれていると登録できない' do
        @user.last_name_kana = 'ヤマモト '
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに英語が含まれていると登録できない' do
        @user.last_name_kana = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに漢字が含まれていると登録できない' do
        @user.last_name_kana = '山本'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaにひらがなが含まれていると登録できない' do
        @user.last_name_kana = 'やまもと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに記号が含まれていると登録できない' do
        @user.last_name_kana = '＠'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name kanaに数字が含まれていると登録できない' do
        @user.last_name_kana = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'first_name_kanaに半角が含まれていると登録できない' do
        @user.first_name_kana = 'ヤマモト '
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに英語が含まれていると登録できない' do
        @user.first_name_kana = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに漢字が含まれていると登録できない' do
        @user.first_name_kana = '山本'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaにひらがなが含まれていると登録できない' do
        @user.first_name_kana = 'やまもと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに記号が含まれていると登録できない' do
        @user.first_name_kana = '＠'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name kanaに数字が含まれていると登録できない' do
        @user.first_name_kana = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it '誕生日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
    context '新規登録ができる時' do
      it 'すべての情報が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
