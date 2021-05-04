# frozen_string_literal: true

class RemoveUidFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :uid, :integer
  end
end
