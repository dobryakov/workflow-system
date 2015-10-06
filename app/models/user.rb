class User < ActiveRecord::Base

  has_many :sent_messages,     class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

  has_many :workers
  has_many :workpoints, :through => :workers

  has_many :group_links, :as => :groupable
  has_many :groups, :through => :group_links

  validates_uniqueness_of :login
  validates_presence_of   :login,    :on => :create

  attr_accessor           :password
  validates_presence_of   :password, :on => :create

  before_create :encrypt_password
  before_save   :encrypt_password

  # создаем начальный (стартовый) воркпоинт каждому зарегистрировавшемуся юзеру
  after_create do
    workpoint = Workpoint.create( :title => "Start workpoint for user #{self.id}" )
    workpoint.users << self
  end

  def filtered(user = self)
    user.password_hash = '[FILTERED]'
    user.password_salt = '[FILTERED]'
    user
  end

  def as_json(options={})
    options[:except] ||= [:password_hash, :password_salt]
    super(options)
  end

  # note for this!
  # http://robots.thoughtbot.com/better-serialization-less-as-json
  def serializable_hash(options={})
    options[:except] ||= [:password_hash, :password_salt]
    super(options)
  end

  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
