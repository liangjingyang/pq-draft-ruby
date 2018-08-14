module API  
  module V1
    class Boxes < Grape::API
      include API::V1::Defaults

      resource :boxes do

        desc "Return all boxes"
        get "", root: :boxes do
          Box.all
        end

        desc "Return a box"
        params do
          requires :id, type: Integer, desc: "ID of the 
            box"
        end
        get ":id", root: "box" do
          Box.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end