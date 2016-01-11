class SearchController < ApplicationController
  def index
    @keyword = params[:search_term]
    @accounts = account_informations(@keyword)

    respond_to do |format|
      format.html
      format.json { render json: @accounts.to_json }
    end
  end

  private

  def find_accounts(keyword)
    # TODO: Find users matches the keyword (hardcoded for now)
    ldap = Net::LDAP.new  :host => "ldap.forumsys.com", # your LDAP host name or IP goes here,
                      :port => "389", # your LDAP host port goes here,
                      :base => "dc=example,dc=com", # the base of your AD tree goes here,
                      :auth => {
                        :method => :simple,
                        :username => "cn=read-only-admin,dc=example,dc=com", # a user w/sufficient privileges to read from AD goes here,
                        :password => "password" # the user's password goes here
                      }
    if ldap.bind
        # Redundant? Sure - the code will be 0 and the message will be "Success".
        puts "Connection successful!  Code:  #{ldap.get_operation_result.code}, message: #{ldap.get_operation_result.message}"
    else
        puts "Connection failed!  Code:  #{ldap.get_operation_result.code}, message: #{ldap.get_operation_result.message}"
    end
    # GET THE DISPLAY NAME AND E-MAIL ADDRESS FOR A SINGLE USER
    search_param = keyword
    result_attrs = ["sAMAccountName", "displayName", "mail"]
    filter = Net::LDAP::Filter.eq( "uid", search_param )
    results = Array.new
    ldap.search(:filter => filter, :attributes => result_attrs, :return_result => false ) do |entry|
        puts entry.dn.split(/=|,/)[1]
         results << entry.dn.split(/=|,/)[1]
    end
    results
    #%w[taro.rakuten hanako.rakuten jiro.rakuten]
  end

  def account_informations(keyword)
    find_accounts(keyword).map do |account|
      AccountOperation.get_status(account)
    end
  end
end
