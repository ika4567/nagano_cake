class ChangeIsActiveDefaultToCustomers < ActiveRecord::Migration[6.1]
  def change
     change_column :customers, :is_active, :boolean, default: false
  end
end
