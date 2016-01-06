class AccountController < ApplicationController
  before_action :assign_account

  # GET /account/:name/status
  # GET /account/:name/status.json
  def status
    @stat = AccountOperation.get_status(@account)

    respond_to do |format|
      format.html
      format.json { render json: @stat.to_json }
    end
  end

  # POST /account/:name/unlock
  # POST /account/:name/unlock.json
  def unlock
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @stat.to_json }
    end
  end

  # POST /account/:name/reset
  # POST /account/:name/reset.json
  def reset
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @stat.to_json }
    end
  end

  private

  def assign_account
    # TODO: Find the specified account
    # If not found, raise 404
    @account = params[:account_id]
  end
end
