class Public::HomesController < ApplicationController
  def top
    render layout: "no_sidebar"
  end
end
