module Clientele
  module Transforms
    module Around
      module FollowRedirects
        module_function

        def call(request)
          response = yield(request)
          if response.status.redirectable?
            response = response.request.client.get( uri: response.headers.location )
          end
          response
        end

      end
    end
  end
end
