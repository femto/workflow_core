# frozen_string_literal: true

class AddColumnsToWorkflows < ActiveRecord::Migration[5.2]
  def change
    change_table :workflows do |t|
      t.string :name, default: ""
      t.text :description, default: ""
    end
  end
end
