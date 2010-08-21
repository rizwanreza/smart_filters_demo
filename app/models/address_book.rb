class AddressBook < ActiveRecord::Base

  class << self

    def smart_filter(options)
      columns.each do |column|
        if options[column.name.to_sym]
          case options[column.name.to_sym].keys.first
          when "contains" 
            return AddressBook.find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "%#{options[column.name.to_sym]["contains"]}%"])
          when "does_not_contain"
            return AddressBook.find(:all, 
                        :conditions => ["#{column.name} NOT LIKE ?", "%#{options[column.name.to_sym]["does_not_contain"]}%"])
          when "is"
            return AddressBook.find(:all, 
                        :conditions => ["#{column.name} = ?", "#{options[column.name.to_sym]["is"]}"])
          when "starts_with"
            return AddressBook.find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "#{options[column.name.to_sym]["starts_with"]}%"])
          when "ends_with"
            return AddressBook.find(:all, 
                        :conditions => ["#{column.name} LIKE ?", "%#{options[column.name.to_sym]["ends_with"]}"])
          else
            return nil
          end
        end
      end
    end

  end

end
