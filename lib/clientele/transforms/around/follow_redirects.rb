module Clientele
  module Transforms
    module Around

      module_function def call(request)
        response = yield(request)
        if response.status.redirectable?
          response = response.request.client.class.get( response.headers.location )
        end
        response
      end

    end
  end
end
