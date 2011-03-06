require 'spec_helper'
require 'objectify'

Object.send :include, Objectify

describe "an objectified hash" do
  subject { {:key => "value", :another_key => "another value"}.objectify }

  its(:key) { should == "value" }
  its(:another_key) { should == "another value" }
end

describe "an objectified hash with nested hashes" do
  let(:objectified) { {:key => {:nested_key => "value"}}.objectify }

  it "should allow nested hashes to be accessed via accessors" do
    objectified.key.nested_key.should == "value"
  end
end

describe "an array with nested hashes" do
  let(:objectified) { [{:key => {:nested_key => [{:first => "first_value"}]}}].objectify }

  it "should allow arrays nested hashes to be accessed via accessors" do
    objectified[0].key == {:nested_key => [{:first => "first_value"}]}
  end

  it "should allow arrays nested nested hashes to be accessed via accessors" do
    objectified[0].key.nested_key.should == [{:first => "first_value"}]
  end

  it "should allow arrays nested nested arrays hashes to be accessed via accessors" do
    objectified[0].key.nested_key[0].first.should == "first_value"
  end

  it "should allow arrays nested hashes to be mapped" do
    objectified[0].key.map {|item| item[0].class }.should == [Symbol]
  end
end

describe "an array with nested hashes constructed with Objectify()" do
  let(:objectified) { Objectify([{:key => {:nested_key => [{:first => "first_value"}]}}]) }

  it "should allow arrays nested hashes to be accessed via accessors" do
    objectified[0].key == {:nested_key => [{:first => "first_value"}]}
  end

  it "should allow arrays nested nested hashes to be accessed via accessors" do
    objectified[0].key.nested_key.should == [{:first => "first_value"}]
  end

  it "should allow arrays nested nested arrays hashes to be accessed via accessors" do
    objectified[0].key.nested_key[0].first.should == "first_value"
  end

  it "should allow arrays nested hashes to be mapped" do
    objectified[0].key.map {|item| item[0].class }.should == [Symbol]
  end
end
