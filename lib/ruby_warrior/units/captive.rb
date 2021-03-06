module RubyWarrior
  module Units
    class Captive < Base
      attr_accessor :bomb_time
      
      def initialize
        add_abilities :explode!
        bind
      end
      
      def max_health
        1
      end
      
      def to_map
        "C"
      end
      
      def play_turn(turn)
        if @bomb_time
          @bomb_time -= 1
          if @bomb_time.zero?
            @bound = false # unbind so it can perform an action
            turn.explode!
          end
        end
      end
    end
  end
end
