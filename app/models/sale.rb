class Sale < ActiveRecord::Base

  # scope :active, -> {where...}

  # Active Record Scope
  def self.active
    where('sales.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current)
  end

  def self.best_sale
    select('*').where('sales.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current).order(:percent_off).last
  end

  def finished?
    ends_on < Date.current
  end
  def upcoming?
    starts_on > Date.current
  end
  def active?
    !upcoming? && !finished?
  end
end
