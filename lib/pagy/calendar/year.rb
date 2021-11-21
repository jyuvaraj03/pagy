# See Pagy::Countless API documentation: https://ddnexus.github.io/pagy/api/calendar
# frozen_string_literal: true

class Pagy # :nodoc:
  class Calendar # :nodoc:
    # Calendar year subclass
    class Year < Calendar
      DEFAULT = { order:  :asc,      # rubocop:disable Style/MutableConstant
                  format: '%Y' }

      protected

      # Setup the calendar variables
      def setup_unit_vars
        super
        @initial   = new_time(@starting.year)
        @final     = new_time(@ending.year + 1)
        @pages     = @last = @final.year - @initial.year
        @from, @to = filter_for(@page)
      end

      # Time for the page
      def start_for(page)
        new_time(@initial.year + snap(page))
      end

      # Filter for the page
      def filter_for(page)
        from = start_for(page)
        [from, new_time(from.year + 1)]
      end
    end
  end
end