module Gql::Types::Input
  class UploadFileInputType < Gql::Types::BaseInputObject

    description 'A file to be uploaded.'

    argument :name, String, required: true, description: 'File name.'
    argument :type, String, required: false, description: "File's content-type."
    argument :content, Gql::Types::BinaryString, required: true, description: 'File content'
  end
end
