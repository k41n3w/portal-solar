class AddCubageToPowerGenerator < ActiveRecord::Migration[5.2]
  def change
    add_column :power_generators, :cubage, :float
  end
end
