# frozen_string_literal: true

class RemoveCepFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cep, :string
  end
end
