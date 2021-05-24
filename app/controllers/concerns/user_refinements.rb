module UserRefinements
    refine Array do
      def search(query)
        filter do |event|
          user.name.downcase.include?(query.downcase)
        end
      end
    end
  end