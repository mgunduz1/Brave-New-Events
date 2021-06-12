class UserFilter < BaseFilter
    using UserRefinements
    attribute :query, :string, default: ""
    
  
    def apply!(chain)
      chain = chain.search(query) if query.present?
      
      chain
    end
  
    def merge!(attribute, value)
      super
  
      send(:"#{attribute}=", value)
  
      @_session[:filters]["User"].merge!(attribute => send(attribute))
    end
  end