require "nmax/version"

module Nmax
  class Error < StandardError; end

  class NmaxRunner
    class << self

      def run(n, stdin = STDIN)
        int_array = []
        stdin.each do |line|
          line.chomp.scan(/\d+/) do | int_subsequence |
            int_array << int_subsequence.to_i
          end
        end
        if int_array.empty?
          puts "No integers in the source"
        elsif int_array.length < n
          puts "Count of integers in the source: #{int_array.length}"
        end
        int_array.max(n)
      end
    end
  end
end
