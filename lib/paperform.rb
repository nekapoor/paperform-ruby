require "faraday"
require "faraday_middleware"
require "json"

module Paperform
  autoload :Client, "paperform/client"
  autoload :Error, "paperform/error"
end
