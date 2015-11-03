class SupportPagesController < ApplicationController

  def about
    render "support_pages/about"
  end

  def contact_us
    render "support_pages/contact_us"
  end
end