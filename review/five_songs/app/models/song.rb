class Song < ActiveRecord::Base
  belongs_to :album
  scope 'recent_five', -> { order('updated_at ASC').limit(5) }
end
