# frozen_string_literal: true

class CreateBaseTables < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :posts do |t|
      t.references :user
      t.string :photo_url
      t.timestamps
    end

    create_table :comments do |t|
      t.references :user
      t.references :post
      t.text :text
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
