module Mongoid
  module DayTime
    class Type
      include Comparable
      attr_reader :time, :hour, :min

      def to_minutes
        hour * 60 + min
      end

      def mongoize
        to_minutes
      end

      def to_i
        to_minutes
      end

      def to_s
        [hour.to_s.rjust(2, '0'), min.to_s.rjust(2, '0')].join(":")
      end

      def <=>(other)
        self.to_i <=> other.to_i
      end

      private
      def initialize(time)
        @time = time
        @hour, @min = time.split(':').map(&:to_i)
      end

      class << self
        def from_minutes(object) # "10:15" = 10 * 60 + 15 = 615
          hour, min = object.divmod(60)
          str = [hour.to_s.rjust(2, '0'), min.to_s.rjust(2, '0')].join(":")
          self.new(str)
        end

        def from_string(object) # "10:15"
          self.new(object)
        end

        def demongoize(object)
          case object
          when Integer
            self.from_minutes(object).to_s
          else
            raise TypeError
          end
        end

        def mongoize(object)
          case object
          when Integer
            self.from_minutes(object).mongoize
          when String
            self.from_string(object).mongoize
          when self
            object
          else
            raise TypeError
          end
        end

        def evolve(object)
          case object
          when Integer
            object
          when self
            object.mongoize
          else
            raise TypeError
          end
        end

      end
    end
  end
end
