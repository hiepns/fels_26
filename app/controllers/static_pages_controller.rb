require 'will_paginate/array'
class StaticPagesController < ApplicationController
  def home
    unless current_user.nil?
      @feed_items = current_user.feed.paginate page: params[:page], per_page: 5
    end
  end

  def about
  end

  def contact
  end

  def help
  end
end
