class CreateInitialModels < ActiveRecord::Migration[5.0]
  def change
    create_table :talkers do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :hobby
      t.string :occupation
      t.text :note
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps
    end

    create_table :rooms do |t|
      t.string :name, null: false
      t.string :subtitle
      t.text :note

      t.timestamps
    end

    create_table :messages do |t|
      t.references :talker, foreign_key: true, index: true, null: false
      t.references :room, foreign_key: true, index: true, null: false
      t.text :text, null: false

      t.timestamps
    end

    create_table :talker_rooms do |t|
      t.references :talker, foreign_key: true, index: true, null: false
      t.references :room, foreign_key: true, index: true, null: false

      t.timestamps
    end
    add_index :talker_rooms, [ :talker_id, :room_id ], unique: true
  end
end
