# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_news_item, only: %i[edit update destroy]
  # task 2.1
  before_action :set_issues_list

  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      # task 2.1
      @representative.news_items << @news_item
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  def search_results
    r_id = params[:news_item][:representative_id]
    iss = params[:news_item][:issue]
    @news_item = NewsItem.where(representative_id: r_id, issue: iss).limit(5)
    session[:search_results] = @news_item.map(&:attributes)
    redirect_to search_results_path # TODO: task2.3 redirect to new page
    
  end


  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # task 2.1
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
  end

  def set_issues_list
    @issues_list = ['Free Speech', 'Immigration', 'Terrorism', "Social Security and
    Medicare", 'Abortion', 'Student Loans', 'Gun Control', 'Unemployment',
                    'Climate Change', 'Homelessness', 'Racism', 'Tax Reform', "Net
    Neutrality", 'Religious Freedom', 'Border Security', 'Minimum Wage',
                    'Equal Pay']
  end
end
