module ApplicationHelper
  def full_title page_title = ""
    base_title = t "layout.admin.title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def create_index params_page, index, per_page
    params_page = 1 if params_page.nil?
      (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

end
