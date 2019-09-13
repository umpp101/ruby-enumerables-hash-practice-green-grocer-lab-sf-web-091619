def consolidate_cart(cart)
  new_cart = {}
  cart.each do |item| 
    item.each do |name,description|
      if new_cart[name]
        new_cart[name][:count] += 1
        
    else
      new_cart[name]=description
      new_cart[name][:count] = 1
    end
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
    coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] 
      if cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
      
      cart["#{item} W/COUPON"]={:price => coupon[:cost]/coupon[:num],:clearance => cart[item][:clearance],:count => coupon[:num]}
      cart[item][:count] -= coupon[:num]
      
    elsif cart[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
    
    cart["#{item} W/COUPON"][:count] += coupon[:num]
    cart[item][:count] -= coupon[:num]
      end
    end
  end
  cart
end	
  
def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
