class Admin::PedidosController < AdminsBackofficeController
  def index
    @pedidos = Pedido.order(updated_at: :desc)
  end
end
