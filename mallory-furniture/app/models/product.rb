class Product
  attr_accessor :pid, :item, :description, :price, :condition,
                :dimension_w, :dimension_l, :dimension_h, :img_file,
                :quantity, :category

  def location
    case
    when self.pid.to_i < 200; location = "north"
    when self.pid.to_i < 300; location = "south"
    else location = "west"
    end
    location
  end

  def discount_price
    case
    when self.condition == "good"; discount_price = (self.price.to_f * 0.9)
    when self.condition == "average"; discount_price = (self.price.to_f * 0.8)
    else; discount_price = (self.price.to_f * 1.0)
    end
    discount_price.to_f
  end

  def formatted_number(n)
  	a,b = sprintf("%0.2f", n).split('.')
  	a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
  	"$#{a}.#{b}"
  end
end
