class AddAttachmentAvatarToBoats < ActiveRecord::Migration[5.0]
    def up
      add_attachment :boats, :avatar
    end

    def down
      remove_attachment :boats, :avatar
    end
end
