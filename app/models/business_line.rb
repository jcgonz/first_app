class BusinessLine < ActiveRecord::Base

  def monthly_gross_revenue
    if ( margin.present? && monthly_revenue.present? ) 
      margin * monthly_revenue
    else
      0
    end
  end

  def value_of_position 
    if ( position_in_business.present? && valuation.present?)
      position_in_business * valuation
    else
      0
    end
  end

end
