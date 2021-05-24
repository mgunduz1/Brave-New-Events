module EventRefinements
    refine Array do
      def search(query)
        filter do |event|
          event.title.downcase.include?(query.downcase) || event.location.downcase.include?(query.downcase)
        end
      end
    end
  end