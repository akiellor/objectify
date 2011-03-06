module Objectify
  class Proxy
    def == other
      @target == other
    end

    def initialize target
      @target = target
    end

    def method_missing name, *args, &block
      if @target.is_a?(Hash) && @target.has_key?(name)
        Proxy.new @target[name]
      else
        Proxy.new @target.send(name, *args, &block)
      end
    end
  end

  def objectify
    Proxy.new self
  end
end

def Objectify object
  Objectify::Proxy.new object
end
