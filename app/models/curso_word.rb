class CursoWord < ApplicationRecord
  belongs_to :curso, class_name: "Curso"
  belongs_to :word, class_name: "Word"
end
