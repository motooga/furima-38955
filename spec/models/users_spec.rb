require 'rails_helper'

RSpec.describe Users, type: :model do
  befor do
    @user = FactoryBot.build(:user)
  end
  
end
