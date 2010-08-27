# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :sort_smart_filter
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def sort_smart_filter
    if params[:smart_filter]
      search = params[:smart_filter]
      hash = {}
      search.delete_if {|column, value| value[:value] == "" }
      search.each do |column, value|
        hash.merge!({column.to_sym => {value[:criteria] => value[:value]}})
      end
      @filtered_results = AddressBook.smart_filter(hash)
    end
  end
end
