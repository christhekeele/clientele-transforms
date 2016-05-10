require "clientele/transforms/version"

module Clientele
  module Transforms

    module Before; end
    module Around; end
    module After;  end
    
    def self.const_missing(const)
      [Before, Around, After].each do |mod|
        return mod.const_get const rescue nil
      end or super
    end
    
  end
  
  def self.const_missing(const)
    Transforms.const_get(const) or super
  end
end

require "clientele/transforms/before"
require "clientele/transforms/around"
require "clientele/transforms/after"
