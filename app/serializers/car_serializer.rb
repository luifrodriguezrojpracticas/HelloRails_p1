class CarSerializer < ActiveModel::Serializer
    attributes :id, :name, :document, :plate, :created_at
end