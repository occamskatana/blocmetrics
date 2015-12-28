class Event < ActiveRecord::Base
  belongs_to :application

  default_scope {order('created_at DESC')}
end
