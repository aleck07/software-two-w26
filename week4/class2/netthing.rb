require 'net/http'

class NetThing
  def do_thing(wrapper)
    wrapper.do_thing()
  end
end

class RequestWrapper
    def initialize(req)
        @req = req
    end

    def do_thing()
        if @req.to_hash.key?("x-special-header")
            return "OK"
        end
        nil
    end
end

class FakeRequestWrapper
  def initialize(assertValue = nil)
      @assertValue = assertValue
  end

  def do_thing()
    @assertValue
  end
end

if __FILE__ == $0
  # Run this stuff if this file is executed directly
  # but not if it is `require`d

  nt = NetThing.new

  req = Net::HTTP::Get.new('http://example.com/')
  wrapper = RequestWrapper.new(req)
  pp wrapper.do_thing()   # nil

  req = Net::HTTP::Get.new('http://example.com/', {"x-special-header" => "Yes"})
  wrapper = RequestWrapper.new(req)
  pp wrapper.do_thing()   # "OK"
end
