module Polling
  module Sleep
    module_function
    def exec(stime)
      stime > 0 ? (sleep stime) : false
    end
  end
end
