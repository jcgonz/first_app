class BusinessLine < ActiveRecord::Base

  def monthly_gross_revenue
    if ( margin.present? )
      margin * monthly_revenue
    else
      0
    end
  end

end
