class ImportServiceFreight
  def initialize(file)
    @file = file
  end

  def process_pdf
    texto_extraido = extraindo_texto_pdf
    texto_interpretado_gpt(texto_extraido)
  end

  private

  def extraindo_texto_pdf
    # Converter o PDF em imagens usando pdftoppm
    system("pdftoppm #{@file.path} output -png")

    # Agora, você pode processar cada imagem gerada com o Tesseract
    texto_extraido = ""
    Dir["output-*.png"].each do |imagem|
      texto_extraido += RTesseract.new(imagem, lang: "por").to_s
    end

    texto_extraido
  rescue StandardError => e
    Rails.logger.error("Erro ao extrair texto do PDF: #{e.message}")
    nil
  end

  def texto_interpretado_gpt(text)
    return if text.blank?

    # Criação do cliente OpenAI
    client = OpenAI::Client.new(access_token: API_KEY)

    # Montando os parâmetros
    request_body = {
      model: "gpt-4o",
      messages: [
        { role: "user", content: "Monte uma frase pra mim" }  # Usando o texto extraído do PDF aqui
      ]
    }

    # Log do corpo da requisição
    Rails.logger.info "Requisição enviada: #{request_body}"

    begin
      response = client.chat.completions.create(
        request_body,
        headers: {
          "Authorization" => "Bearer #{API_KEY}",
          "Content-Type" => "application/json"
        }
      )

      # Log da resposta
      Rails.logger.info "Resposta recebida: #{response}"

      response.dig("choices", 0, "message", "content")
    rescue StandardError => e
      Rails.logger.error("Erro ao interpretar texto com GPT-4: #{e.message}")
      nil
    end
  end
end
