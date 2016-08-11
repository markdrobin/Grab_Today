class User < ActiveRecord::Base
  has_many :stores
  has_many :orders
  accepts_nested_attributes_for :stores
  accepts_nested_attributes_for :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :avatar, default_url: "/assets/default_pp.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def get_stores
    stores
  end

  def get_orders
    unless is_owner?
      orders
    end
  end

  def is_owner?
    user_type == 'Store Owner'
  end

  def get_store_orders
    unless !is_owner?
      if stores
        @store_orders = []
        stores.each do |s|
          if !StoreOrder.where(store_id: s.id).nil?
            @store_orders << StoreOrder.where(store_id: s.id)
          end
        end
      end
      @store_orders
    end
  end

end
