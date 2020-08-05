# frozen_string_literal: true

class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :question_6, :string
    add_column :users, :question_7, :string
  end
end
