class AddPositionRefToPositionUsers < ActiveRecord::Migration
  def change
    add_reference :position_users, :position, index: true
  end
end
