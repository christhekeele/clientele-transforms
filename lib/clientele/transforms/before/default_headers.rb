module Clientele
  module Transforms
    module Before
      module DefaultHeaders
        module_function

        def call(request)
          request.update_headers request.headers.to_h.merge(request.config.default_headers.to_h || {})
        end

        def inject(headers)
          -> request do
            request.update_headers request.headers.to_h.merge(headers)
          end
        end

      end
    end
  end
end
