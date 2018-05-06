module CartsHelper


  def add_carts id_product
    id = id_product
    session[:order_items][id] ||= 0
    # update số lượng nếu người dùng bấm 2 lần thêm giỏ hàng cùng 1 sản phẩm
    session[:order_items].each do |t, val|
      if t == id_product
        val += 1
        session[:order_items][t] = val
      end
    end
    session[:time][id] = Time.now
  end

  def product_in_carts
    products_cart = Array.new
    session[:order_items].each_key do |i|
      if !i.nil?
        product = Product.find_by id: i
        session[:order_items].delete i if product.nil?
        products_cart.push(product)
      else
        next
      end
    end
    return products_cart
  end

  def subtotal
    total ||= 0
    if !product_in_carts.nil?
      product_in_carts.each do |t|
        if !t.nil?
          total += t.price * session[:order_items]["#{t.id}"].to_i
        else
          next
        end
      end
    else
      total = 0
    end
    return total
  end

  def many_carts
    session[:order_items].length
  end

  def destroy_carts id
    session[:order_items].delete id
  end
end
