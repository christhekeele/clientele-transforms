module Clientele
  module Transforms
    module Before
      module EnsureTrailingSlash
        module_function

        def call(request)
          if needs_trailing_slash? request.uri
            puts "needs trailing slash"
            request.update_uri HTTP::URI.new(request.uri + '/')
          else
            request
          end
        end

        def needs_trailing_slash?(uri)
          not uri.extname.length > 1 and not uri.to_s.end_with? '/'
        end

      end
    end
  end
end
