class EventFilter < BaseFilter
    using EventRefinements
    attribute :query, :string, default: ""
    
  
    def apply!(chain)
      chain = chain.search(query) if query.present?
      
      chain
    end
  
    def merge!(attribute, value)
      super
  
      send(:"#{attribute}=", value)
  
      @_session[:filters]["Event"].merge!(attribute => send(attribute))
    end
  end