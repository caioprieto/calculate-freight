class Admin::AlunosController < AdminsBackofficeController
  def index
    @alunos = User.joins(:user_words).uniq
  end
end
