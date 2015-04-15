require 'httparty'
require 'json'
require 'erb'

require 'qualys/version'

require 'qualys/config'
require 'qualys/api'
require 'qualys/auth'

require 'qualys/scans'


module Qualys

  extend self

  def configure
    block_given? ? yield(Config) : Config
    %w(username password).each do |key|
      if Qualys::Config.instance_variable_get("@#{key}").nil?
        raise Qualys::Config::RequiredOptionMissing,
          "Configuration parameter missing: '#{key}'. " +
          "Please add it to the Qualys.configure block"
      end
    end
  end
  alias_method :config, :configure

end