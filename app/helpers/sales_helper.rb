module SalesHelper
  def active_sale?
    Sale.active.any?
  end
  def best_sale
    Sale.best_sale
  end
end