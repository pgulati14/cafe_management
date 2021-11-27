class Menu < ApplicationRecord
  def to_pleasant_string
    "#{menu_id}. #{menu_name}"
  end
end
