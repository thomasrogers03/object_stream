module ThomasUtils
  module Enum
    class Combiner
      include Enumerable

      def initialize(lhs, rhs)
        @lhs = lhs
        @rhs = rhs
      end

      def each(&block)
        return self unless block_given?

        lhs.each(&block)
        rhs.each(&block)
      end

      def ==(rhs_combiner)
        rhs_combiner.is_a?(Combiner) &&
            rhs_combiner.lhs == lhs &&
            rhs_combiner.rhs == rhs
      end

      protected

      attr_reader :lhs, :rhs

    end
  end
end

