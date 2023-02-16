# frozen_string_literal: true

require 'thor'

module Sampple
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'sampple version'
    def version
      require_relative 'version'
      puts "v#{Sampple::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'scanner IP PORTS...', 'Use ip and Ports you want to be tested'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Use ip and any ports you wanted to be tested'
    def scanner(ip, *ports)
      if options[:help]
        invoke :help, ['scanner']
      else
        require_relative 'commands/scanner'
        Sampple::Commands::Scanner.new(ip, ports, options).execute
      end
    end
  end
end
