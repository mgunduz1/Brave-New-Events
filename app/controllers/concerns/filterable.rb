module Filterable
    extend ActiveSupport::Concern
  
    included do
      if respond_to?(:helper_method)
        helper_method :filter_active_for?
        helper_method :filter_for
      end
    end
  
    def filter_active_for?(resource, attribute, value=true)
      filter = filter_for(resource)
  
      filter.active_for?(attribute, value)
    end
  
    private
  
    def filter_for(resource)
      "#{resource}Filter".constantize.new(session)
    end
  
    def set_filter_for!(resource, param, value)
      filter_for(resource).merge!(param, value)
    end
  end