class AddressBook < ActiveRecord::Base
  class << self
    def smart_filter(options)
      columns.each do |column|
        if options[column.name.to_sym]
          case options[column.name.to_sym].keys.first
          when "contains" 
            return find(:all, 
                        :conditions => ['name LIKE ?', "%#{options[column.name.to_sym]["contains"]}%"])
          when "does_not_contain"
            return find(:all, 
                        :conditions => ['name NOT LIKE ?', "%#{options[column.name.to_sym]["does_not_contain"]}%"])
          when "is"
            return find(:all, 
                        :conditions => ['name = ?', "#{options[column.name.to_sym]["is"]}"])
          end
        end
      end
    end
  end
end
