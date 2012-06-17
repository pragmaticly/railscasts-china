require 'spec_helper'

describe Episode do
  subject { create(:episode) }
  it { should belong_to(:user)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :permalink }
  it { should validate_presence_of :description }
  it { should validate_presence_of :notes }
end
