require 'spec_helper'

describe Link do

  before(:each) { @link = FactoryGirl.build(:link) }

  subject { @link }

  it { should respond_to(:url) }
  it { should respond_to(:shortcode) }
  it { should respond_to(:last_seen) }
  it { should respond_to(:redirect_count) }

  it "url returns a string" do
    expect(@link.url).to match 'http://www.test.url'
  end

  it "shortcode returns a string" do
    expect(@link.shortcode).to match 'shorte'
  end

  it "last_seen returns nil" do
    expect(@link.last_seen).to be_nil
  end

  it "last_seen returns 0" do
    expect(@link.redirect_count).to match 0
  end

  it "shortcode should have 6" do
    expect(FactoryGirl.build(:link, shortcode: "123456")).to      be_valid
    expect(FactoryGirl.build(:link, shortcode: "1234")).not_to    be_valid
    expect(FactoryGirl.build(:link, shortcode: "1234567")).not_to be_valid
  end

  it "should raise recordinvalid without shortcode" do
    expect {
      FactoryGirl.create :link, shortcode: nil
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
