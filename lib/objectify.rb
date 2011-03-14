require 'active_support'

module Objectify
  class Proxy < ActiveSupport::BasicObject
    def initialize target
      @target = target
    end

    def method_missing name, *args, &block
      if @target.respond_to?(:has_key?) && @target.has_key?(name)
        Proxy.new @target[name]
      else
        Proxy.new @target.send(name, *args, &block)
      end
    end

    def send name, *args, &block
      method_missing name.to_sym, *args, &block
    end
  end

  def objectify
    Proxy.new self
  end
end

def Objectify object
  Objectify::Proxy.new object
end
