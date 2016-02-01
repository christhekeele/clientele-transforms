require "clientele/transforms/version"

module Clientele
  module Transforms

    module Before; end
    module Around; end
    module After;  end
    
  end
end

require "clientele/transforms/before"
require "clientele/transforms/around"
require "clientele/transforms/after"
