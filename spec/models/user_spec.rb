require 'spec_helper'

describe User do
  subject { create(:user) }

  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of(:uid).scoped_to(:provider) }

  context ".create_with_omniauth" do
    let(:full_auth) {
      {
        'provider' => 'github',
        'uid'      => '12345',
        'info'     => {
          'name'   => 'Dingding Ye',
          'email'  => 'yedingding@gmail.com'
        }
      }
    }

    let(:partial_auth) {
      {
        'provider' => 'github',
        'info'     => {
          'name'   => 'Dingding Ye'
        }
      }
    }

    it "should create the user" do
      expect {
        user = User.create_with_omniauth(full_auth)
        user.provider.should == 'github'
        user.uid.should == '12345'
        user.name.should == 'Dingding Ye'
        user.email.should == 'yedingding@gmail.com'
      }.to change(User, :count).by(1)
    end

    it "should fail to create  the user" do
      expect {
        user = User.create_with_omniauth(partial_auth)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
