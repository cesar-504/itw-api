class PublicationSerializer < ActiveModel::Serializer

  #attributes :id, :title, :content, :user.first_name, :user.last_name, :objetive.first_name, :objective.last_name, :created_at, :updated_at
  attributes :title, :content, :created_at, :updated_at
  #def content_short() object.content[0,10] end

  link(:self) { publication_url(object) }
  belongs_to :user
  belongs_to :objective




end
