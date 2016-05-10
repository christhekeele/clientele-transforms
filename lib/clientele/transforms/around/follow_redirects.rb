require "clientele/utils"

module Clientele
  module Transforms
    module Around
      module FollowRedirects
        
        include Clientele::Utils::URI
        extend Clientele::Utils::URI
        
      module_function

        def call(request)
          response = yield(request)
          if response.status.redirectable?
            response = response.client.send(
              response.request.verb.to_sym,
              root: uri_root(response.headers.location), 
              path: uri_rest(response.headers.location),
            )
          end
          response
        end

      end
    end
  end
end
