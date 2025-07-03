# lib/tasks/initial.rake
namespace :initial do
  desc "Configura o Ambiente de desenvolvimento"
  task setup: :environment do
    show_spinner("Apagando DB...") { Rake::Task["db:drop"].invoke }
    show_spinner("Criando DB...") { Rake::Task["db:create"].invoke }
    show_spinner("Migrando DB...") { Rake::Task["db:migrate"].invoke }
    show_spinner("Cadastrando cursos...") { Rake::Task["initial:add_cursos"].invoke }
    show_spinner("Cadastrando admin...") { Rake::Task["initial:add_admin"].invoke }
  end

  task add_cursos: :environment do
    Curso.create!(
      name: "Curso Unicamp",
      description: "...",
      prova: "unicamp",
      tipo: "dissertativo-argumentativo",
      value: 100,
      value_riscado: 250,
      vigencia: 6
    )

        Curso.create(
      name: "Curso Enem",
      description: "Prepare-se com o curso mais completo e estratégico para o ENEM! O Curso ENEM Nota 1000 foi desenvolvido por especialistas com experiência em aprovações nas principais universidades do Brasil ✅",
      prova: "enem",
      tipo: "dissertativo-argumentativo",
      value: 100,
      value_riscado: 250,
      vigencia: 6
    )

    Curso.create(
      name: "Curso Unesp",
      description: "Prepare-se com o curso mais completo e estratégico para o UNESP! O Curso UNESP Nota 1000 foi desenvolvido por especialistas com experiência em aprovações nas principais universidades do Brasil ✅",
      prova: "unicamp",
      tipo: "dissertativo-argumentativo",
      value: 100,
      value_riscado: 250,
      vigencia: 6
    )

    Curso.create(
      name: "Curso Fuvest",
      description: "Prepare-se com o curso mais completo e estratégico para o FUVEST O Curso FUVEST Nota 1000 foi desenvolvido por especialistas com experiência em aprovações nas principais universidades do Brasil ✅",
      prova: "unicamp",
      tipo: "dissertativo-argumentativo",
      value: 100,
      value_riscado: 250,
      vigencia: 6
    )
  end

  task add_admin: :environment do
    Admin.create!(email: "aprovaredacao@gmail.com", password: "123321")
  end

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
