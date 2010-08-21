class AddressBook < ActiveRecord::Base

  class << self

    def smart_filter(options)
      columns.each do |column|
        if options[column.name.to_sym]
          case options[column.name.to_sym].keys.first
          when "contains" 
            return find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "%#{options[column.name.to_sym]["contains"]}%"])
          when "does_not_contain"
            return find(:all, 
                        :conditions => ["#{column.name} NOT LIKE ?", "%#{options[column.name.to_sym]["does_not_contain"]}%"])
          when "is"
            return find(:all, 
                        :conditions => ["#{column.name} = ?", "#{options[column.name.to_sym]["is"]}"])
          when "starts_with"
            return find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "#{options[column.name.to_sym]["starts_with"]}%"])
          when "ends_with"
            return find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "%#{options[column.name.to_sym]["ends_with"]}"])
          when "equals_to"
            return find(:all,
                        :conditions => ["#{column.name} = ?", "#{options[column.name.to_sym]["equals_to"]}"])
          when "greater_than"
            return find(:all,
                        :conditions => ["#{column.name} > ?", "#{options[column.name.to_sym]["greater_than"]}"])
          when "less_than"
            return find(:all,
                        :conditions => ["#{column.name} < ?", "#{options[column.name.to_sym]["less_than"]}"])
          when "between"
            return find(:all,
                        :conditions => ["#{column.name} BETWEEN ? AND ?", "#{options[column.name.to_sym]["between"].first}", "#{options[column.name.to_sym]["between"].last}"])
          else
            return []
          end
        end
      end
    end

  end

end
