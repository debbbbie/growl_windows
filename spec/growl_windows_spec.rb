require File.expand_path('../../lib/growl_windows', __FILE__)
describe Growl do

  describe "#installed?" do
    it "should check if growlnotify is available" do
      Growl.should be_installed
    end
  end

  describe "#version" do
    it "should return only the version triple" do
      Growl.version.should_not eq('')
    end
  end

  describe "#bin_path" do
    it "should exist this file" do
      File.exists?(Growl.bin_path).should be(true)
    end
  end

  describe "#notify" do
    it "should get a notification from Growl for windows" do
      Growl.notify("test succeed").should be(true)
    end

  end
end