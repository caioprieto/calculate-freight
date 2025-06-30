class Admin::CorrecoesController < AdminsBackofficeController
  def index
    @alunos = User.joins(:user_words).uniq
  end
end
