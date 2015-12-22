class User < ActiveRecord::Base
  # attr_accessor invite_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, autosave: true
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
  belongs_to :invite

  accepts_nested_attributes_for :profile, allow_destroy: true
  validates_presence_of :email, :password
  def invite_token=(token)
    self.invite = Invite.find_by_token(token)
  end
end
