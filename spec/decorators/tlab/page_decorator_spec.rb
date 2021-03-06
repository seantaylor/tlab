require 'spec_helper'

describe Tlab::PostDecorator do
  let (:post) { stub_model(Tlab::Post, title: 'A test') }
  let (:decorator) { post.decorate }
  let (:request) { double("Request") }

  before (:each) { request.stub(:original_url).and_return('http://test.com') }

  describe '#share_facebook' do
    subject { decorator.share_facebook request }
    it { should eq "https://www.facebook.com/sharer/sharer.php?u=http://test.com" }
  end

  describe '#share_twitter' do
    subject { decorator.share_twitter request }
    it { should eq "http://twitter.com/share?url=#{u "http://test.com"}" }
  end

  describe "#share_linkedin" do
    subject { decorator.share_linkedin request }
    it { should eq "http://www.linkedin.com/shareArticle?mini=true&url=http://test.com&title=A test" }
  end

  describe "#share_google_plus" do
    subject { decorator.share_google_plus request }
    it { should eq "https://plus.google.com/share?url=http://test.com" }
  end
end

