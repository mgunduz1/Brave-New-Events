class FilterReflex < ApplicationReflex
    include Filterable
    
    def filter
      resource, param = element.dataset.to_h.fetch_values(:resource, :param)
      value = if element["type"] == "checkbox"
        element.checked
      else 
        element.dataset.value || element.value
      end
  
      set_filter_for!(resource, param, value)
    end  
  end
  