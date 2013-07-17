module Rack
  class Webconsole
    class Assets
      private
      def check_html?(headers, response)
        if headers['Content-Type'] and headers['Content-Type'].include? 'text/html'
          body = response.respond_to?(:body) ? response.body : response.first
        end

        body =~ %r{<html.*</html>}m
      end
    end
  end
end
