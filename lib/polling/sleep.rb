module Polling
  module Sleep
    def self.exec stime
      stime > 0 ? (sleep stime) : false
    rescue Interrupt
      exit 0
    end
  end
end
