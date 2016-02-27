require 'spec_helper'

describe Link do

  before(:each) { @link = FactoryGirl.build(:link) }

  subject { @link }

  it { should respond_to(:url) }
  it { should respond_to(:shorten) }
  it { should respond_to(:last_seen) }
  it { should respond_to(:redirect_count) }

  it "url returns a string" do
    expect(@link.url).to match 'http://www.test.url'
  end

  it "shorten returns a string" do
    expect(@link.shorten).to match 'shorte'
  end

  it "last_seen returns nil" do
    expect(@link.last_seen).to be_nil
  end

  it "last_seen returns 0" do
    expect(@link.redirect_count).to match 0
  end

  it "shorten should have 6" do
    expect(FactoryGirl.build(:link, shorten: "123456")).to      be_valid
    expect(FactoryGirl.build(:link, shorten: "1234")).not_to    be_valid
    expect(FactoryGirl.build(:link, shorten: "1234567")).not_to be_valid
  end

  it "should raise recordinvalid without shorten" do
    expect {
      FactoryGirl.create :link, shorten: nil
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should raise recordinvalid without url" do
    expect {
      FactoryGirl.create :link, url: nil
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should be valid" do
    expect(FactoryGirl.create(:link)).to be_valid
  end

end
