# frozen_string_literal: true

class RelationshipsToFollowRelations < ActiveRecord::Migration[6.1]
  def change
    rename_table :relationships, :follow_relationships
  end
end
