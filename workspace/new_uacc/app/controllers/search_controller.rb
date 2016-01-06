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
    %w[taro.rakuten hanako.rakuten jiro.rakuten]
  end

  def account_informations(keyword)
    find_accounts(keyword).map do |account|
      AccountOperation.get_status(account)
    end
  end
end
