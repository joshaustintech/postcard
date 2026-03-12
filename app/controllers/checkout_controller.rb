# frozen_string_literal: true

class CheckoutController < ApplicationController
  prepend_before_action :authenticate_account!
  before_action :set_account_from_path
  before_action :redirect_in_solo

  def show
    url = @account.checkout_url(page_url(@account), page_url(@account))
    redirect_to url, status: :found, allow_other_host: true
  end

  private

  def redirect_in_solo
    redirect_to page_path(@account) if Rails.configuration.solo_mode
  end
end
