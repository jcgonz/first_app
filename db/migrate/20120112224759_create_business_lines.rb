class CreateBusinessLines < ActiveRecord::Migration
  def self.up
    create_table :business_lines do |t|
      t.string :name
      t.integer :monthly_revenue
      t.float :margin
      t.integer :valuation
      t.float :position_in_business
      t.float :full_time_workers
      t.integer :revenue_months

      t.timestamps
    end
  end

  def self.down
    drop_table :business_lines
  end
end
