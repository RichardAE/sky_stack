require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question)                     }
  it { should belong_to(:user)                         }
  it { should have_many(:comments).dependent(:destroy) }

  it { should validate_length_of :text                 }
end
