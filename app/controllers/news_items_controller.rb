# frozen_string_literal: true

class NewsItemsController < ApplicationController
  before_action :set_representative
  before_action :set_news_item, only: %i[show]

  def index
    @news_items = @representative.news_items
  end

  def show; end

  def search
    @news_item = NewsItem.where(representative_id: params[:representative_id]).limit(5)
    session[:search_results] = @news_item.map(&:attributes)
    redirect_to search_results_path# TODO: task2.3 redirect to new page
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end



end
