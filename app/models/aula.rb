class Aula < ApplicationRecord
  belongs_to :modulo, class_name: "::Modulo", inverse_of: :aulas
  belongs_to :word, class_name: "::Word", optional: true

  has_one_attached :video

  has_many :user_aulas, dependent: :destroy
  has_many :users, through: :user_aulas

  validates :titulo, presence: true

  delegate :curso_id, :curso, to: :modulo, prefix: false, allow_nil: true

  after_save :update_words, if: :saved_change_to_word_id?

  # after_commit :extrair_duracao_video, on: [ :create, :update ]

  # def extrair_duracao_video
  #   return unless video.attached?

  #   video.open do |file|
  #     movie = FFMPEG::Movie.new(file.path)
  #     update(duration_in_seconds: movie.duration.to_i)
  #   end
  # end

  def update_words
    old_word_id = word_id_before_last_save
    new_word_id = word_id

    # Adiciona o novo word_id se não estiver no curso
    if new_word_id.present? && !curso.word_ids.include?(new_word_id)
      curso.add_word(new_word_id)
    end

    if old_word_id.present? && old_word_id != new_word_id
      # Só remove se nenhuma outra aula usar
      unless curso.aulas.where(word_id: old_word_id).exists?
        curso.curso_words.find_by(word_id: old_word_id)&.destroy
      end
    end
  end
end
