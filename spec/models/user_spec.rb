require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions).dependent(:destroy) }
  it { should have_many(:answers).dependent(:destroy)   }
  it { should have_many(:comments).dependent(:destroy)  }

  it { should validate_length_of(:user_name)            }
end
