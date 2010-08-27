# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
=begin
<div id="name-smart-field">
  <form action="/address_books" method="get" accept-charset="utf-8">
    <label for="name">Name</label>
    <select name="smart_filter[name][criteria]" id="criteria">
      <option value="contains">Contains</option>
      <option value="does_not_contain">Does not contain</option>
      <option value="is">is</option>
      <option value="starts_with">Starts with</option>
      <option value="ends_with">Ends with</option>
    </select>

    <input type="search" name="smart_filter[name]" value="" id="name">
    <input type="submit" value="Continue &rarr;">
  </form>
</div>
=end

  def smart_filter(model, cols)
    html = ""
    html << "<form action='/address_books' method='get'>"
    columns(cols).each do |column|
      html << content_tag(:label, column.capitalize, :for => "#{column}")
      html << content_tag(:select, :name => "smart_filter[#{column}][criteria]", :id => "name-criteria") do
        criteria_options(column)
      end
      html <<  tag("input", { :type => 'text', :name => "smart_filter[#{column}][value]", :placeholder => "String" })
      html << '<br>'
    end
    html << "<input type='submit'>"
    html << "</form>"
    html
  end

  def columns(cols)
    if cols == :all
      all_cols = AddressBook.column_names
      all_cols.delete("id")
      all_cols
    else
      cols
    end
  end

  def criteria_options(column)
    if AddressBook.columns_hash[column].type == :string or AddressBook.columns_hash[column].type == :text
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
