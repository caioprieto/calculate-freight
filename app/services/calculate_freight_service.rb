require "net/http"
require "uri"
require "json"

class CalculateFreightService
  API_URL = "https://sandbox.melhorenvio.com.br/api/v2/me/shipment/calculate".freeze
  MELHOR_ENVIO_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NTYiLCJqdGkiOiJhZjU3ODNmODYzYzA4NTFiMTgzZjcwOTljOTY1Njc3MjRiNWZkZmQ5ZTQxZWIwYzg2NDhiYWJjYWEzMmIzMjY3YTAwY2JjZjcyZTdkYjI3MyIsImlhdCI6MTczOTQ2MzU0NS4yODY0MTcsIm5iZiI6MTczOTQ2MzU0NS4yODY0MiwiZXhwIjoxNzcwOTk5NTQ1LjI3Mzc3OSwic3ViIjoiOWUyMjIzYmQtMTQ4Ni00YWQwLWFlNGYtNjM0NzA1ZGQ3YmUxIiwic2NvcGVzIjpbImNhcnQtcmVhZCIsImNhcnQtd3JpdGUiLCJjb21wYW5pZXMtcmVhZCIsImNvbXBhbmllcy13cml0ZSIsImNvdXBvbnMtcmVhZCIsImNvdXBvbnMtd3JpdGUiLCJub3RpZmljYXRpb25zLXJlYWQiLCJvcmRlcnMtcmVhZCIsInByb2R1Y3RzLXJlYWQiLCJwcm9kdWN0cy1kZXN0cm95IiwicHJvZHVjdHMtd3JpdGUiLCJwdXJjaGFzZXMtcmVhZCIsInNoaXBwaW5nLWNhbGN1bGF0ZSIsInNoaXBwaW5nLWNhbmNlbCIsInNoaXBwaW5nLWNoZWNrb3V0Iiwic2hpcHBpbmctY29tcGFuaWVzIiwic2hpcHBpbmctZ2VuZXJhdGUiLCJzaGlwcGluZy1wcmV2aWV3Iiwic2hpcHBpbmctcHJpbnQiLCJzaGlwcGluZy1zaGFyZSIsInNoaXBwaW5nLXRyYWNraW5nIiwiZWNvbW1lcmNlLXNoaXBwaW5nIiwidHJhbnNhY3Rpb25zLXJlYWQiLCJ1c2Vycy1yZWFkIiwidXNlcnMtd3JpdGUiLCJ3ZWJob29rcy1yZWFkIiwid2ViaG9va3Mtd3JpdGUiLCJ3ZWJob29rcy1kZWxldGUiLCJ0ZGVhbGVyLXdlYmhvb2siXX0.rBcRnCc_IWC72nkKRN3ZhsGF3FFWwGFxiKeIN7khoh-UXkCxnymEz3E9FoxvIYJAopLT0cTLnm6H6prc9CKYeE0qaO5bddgckAJrR4aKJDLt3SzwLnnaDXihlGmREZ_mtuD5soTIVuCqFHVTgYLPatfhAfQMwRO8A2uAKBIIBPaRFl6jJWvfUP8szEjeQagv-1QcFYwbCwTjcjxwbZOlZoemt_oJIzCsI8VhrFZIzrZ-fxVDEj-jQCVpsWeb8rufq0zH3R5jg_oohvmhwdjJ_f8mSaxevFai7pp5jECHrUGpsIl69_OTJaFa9ifEQUct_Tf4vE7g0u6eCyB1GmCNunGj6HLRwzpoBN-6QACGJ8XxaBMcims5Zx6MgFWBOaOA9e2i_B6fF9gggFVBY5-ToSc4eEhNiVyfMB99RdRcHd-lKD2w2M1zb7Fx9Xu0EEdqTIJwB7LkVivzidOdpod3XKU2ggJJY6lvgrK-fk0vL94zm4OkP9frMGueCytQZOB5kpyr92nuXDn0iT9M6u2zfeeRpS_j18PnzvPIJgYXnDdTSWcWqeRPN9USouZ6rerZ4aADdeZjj4YSE1u63p1vwK_k-VCLlTzdjPHHdtNidKQSl-_LtkDPPu4-xDnRFjHSd7avZVpg0tx4ENRz0qGZv8ALTzQLqWDWvw5ajhn9_A8".freeze

  def initialize(cep_origem, cep_destino, height, width, length, weight, service_type_id)
    @cep_origem = cep_origem
    @cep_destino = cep_destino
    @height = height
    @width = width
    @length = length
    @weight = weight
    @service_type_id = service_type_id
  end

  def call
    response = build_request
    parse_response(response)
  end

  private

  def build_request
    uri = URI.parse(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, header)
    request.body = body.to_json

    http.request(request)
  end

  def parse_response(response)
    return { error: "API não teve retorno" } unless response.body

    parsed_body = JSON.parse(response.body)
    response.code.to_i == 200 ? parsed_body : { error: parsed_body }
  end

  def header
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "User-Agent" => "caiohideki23@gmail.com",
      "Authorization" => "Bearer #{MELHOR_ENVIO_TOKEN}"
    }
  end

  def body
    {
      "from": { "postal_code": @cep_origem },
      "to": { "postal_code": @cep_destino },
      "package": [
        {
          "height": @height,
          "width": @width,
          "length": @length,
          "weight": @weight
        }
      ],
      "services": @service_type_id.to_s
    }
  end
end
