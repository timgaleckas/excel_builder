require 'rubygems'
require 'command_recorder'
require 'rest_client'

module ExcelBuilder
  class Connector
    def self.site
      @@site
    end
    def self.site=(site)
      @@site=site
    end
    def self.user
      @@user
    end
    def self.user=(user)
      @@user=user
    end
    def self.password
      @@password
    end
    def self.password=(password)
      @@password=password
    end
    def self.generate_xlsx(filename, &block)
      cr = CommandRecorder.record &block
      RestClient.post self.site + '/' + filename, :invocation_json => cr.invocation_json
    end
  end
end
