class SmartFilterController < ApplicationController
  def show
  end

  def create
    search = params[:smart_filter]
    hash = {}
    search.delete_if {|column, value| value[:value] == "" }
    search.each do |column, value|
      hash.merge!({column.to_sym => {value[:criteria] => value[:value]}})
    end
    @address_books = AddressBook.smart_filter(hash)
    redirect_to smart_filter_path
  end
end
