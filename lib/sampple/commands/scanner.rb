# frozen_string_literal: true

require_relative '../command'

module Sampple
  module Commands
    class Scanner < Sampple::Command
      require 'socket'

      def initialize(ip, ports, options)
        @ip = ip
        @ports = ports
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        @ports.each{|port| Scanner.scan(@ip,port)}
      end

      private

      def self.scan(host,port)
        begin
          socket = TCPSocket.new(host, port)
          status = "open"
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
            status = "closed"
        end
        puts "Port #{port} is #{status}."
      end
    end
  end
end
