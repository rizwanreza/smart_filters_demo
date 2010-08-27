module ApplicationHelper
  def smart_filter(model, cols, &block)
    body = capture(&block)
    html = ""
    html << "<form action='/address_books' method='get'>"
    html << "<input type='hidden' name='smart_filter[model]' value='#{model}'>"
    columns(model, cols).each do |column|
      
      html << content_tag(:label, column.capitalize, :for => "#{column}")
      html << content_tag(:select, :name => "smart_filter[#{column}][criteria]", :id => "name-criteria") do
        criteria_options(model, column)
      end
      html <<  tag("input", { :type => 'text', :name => "smart_filter[#{column}][value]", :placeholder => "String" })
      html << '<br>'
    end
    html << "<input type='submit'>"
    html << "</form>"
    html << render(:partial => 'shared/filtered_results') if @filtered_results
    html << body unless @filtered_results
    concat html
  end

  def columns(model, cols)
    if cols == :all
      all_cols = model.column_names
      all_cols.delete("id")
      all_cols
    else
      cols
    end
  end

  def criteria_options(model, column)
    if model.columns_hash[column].type == :string or model.columns_hash[column].type == :text
      html = content_tag(:option, :value => "contains") do
        "Contains"
      end
      html << content_tag(:option, :value => "does_not_contain") do
        "Does not Contain"
      end
      html << content_tag(:option, :value => "is") do
        "Is"
      end
      html << content_tag(:option, :value => "starts_with") do
        "Starts with"
      end
      html << content_tag(:option, :value => "ends_with") do
        "Ends with"
      end
    end
    html
  end
end