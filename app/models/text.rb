class Text < ApplicationRecord
  belongs_to :word, class_name: "Word"
end
