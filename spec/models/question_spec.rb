require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:user)                         }
  it { should have_many(:answers).dependent(:destroy)  }
  it { should have_many(:comments).dependent(:destroy) }

  it { should validate_length_of :title }
  it { should validate_length_of :text  }
end
