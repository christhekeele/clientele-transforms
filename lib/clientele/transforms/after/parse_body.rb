module Clientele
  module Transforms
    module After
      class ParseBody
        
        attr_reader :parser
        
        def initialize(parser, &block)
          @parser = if block_given?
            block
          elsif parser and parser.respond_to? :parse
            -> raw { parser.parse raw }
          elsif parser.respond_to? :call
            parser
          else
            raise "parser neither respondes to :parse nor :call"
          end
        end
        
        def call(response)
          response.tap do |response|
            response.body.parse do |raw|
              parser.call raw rescue nil
            end
          end
        end

      end
    end
  end
end
