module Polling
  module Sleep
    def self.exec stime
      stime > 0 ? (sleep stime) : false
    end
  end
end
