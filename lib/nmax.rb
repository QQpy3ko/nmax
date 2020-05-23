require "nmax/version"

module Nmax
  class Error < StandardError; end

  class NmaxRunner
    class << self
      def run(n)
        int_array = []
        STDIN.each do |line|
          line.chomp.scan(/\d+/) do | int_subsequence |
            int_array << int_subsequence.to_i
          end
        end
        puts int_array.max(n)
      end
    end
  end
end
