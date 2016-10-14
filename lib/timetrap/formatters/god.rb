module Timetrap
  module Formatters
    class God
      attr_reader :output

      def initialize entries
        @output = entries.inject("id,start,end,note,sheet\n") do |out, e|
          next(out) unless e.end
          out << %|"#{e.id}","#{e.start.strftime(time_format)}","#{e.end.strftime(time_format)}","#{e.note}","#{e.sheet}"\n|
        end
      end

      private
      def time_format
        "%Y-%m-%d %H:%M:%S"
      end
    end
  end
end
