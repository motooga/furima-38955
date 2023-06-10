require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    driven_by(:selenium_chrome)
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      click_link '新規登録'

      # 必要な情報を埋めると新規登録が成功してトップページに遷移する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[last_name]', with: @user.last_name
      fill_in 'user[first_name]', with: @user.first_name
      fill_in 'user[last_name_kana]', with: @user.last_name_kana
      fill_in 'user[first_name_kana]', with: @user.first_name_kana
      find('.select-box').click
      select '2000', from: 'user_bith_date_1i'
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      sleep 1

      expect(current_path).to eq(root_path)

      # 登録したユーザー名が表示されている
      expect(page).to have_content("#{@user.name}")
    end
  end
end
