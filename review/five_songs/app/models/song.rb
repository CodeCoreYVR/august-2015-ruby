class Song < ActiveRecord::Base
  scope 'recent_five', -> { order('updated_at ASC').limit(5) }
end
