class SearchsController < ApplicationController

  def search
    @ubg = (params[:ubg]).to_i
    moji = (params[:moji]).to_i

    if @ubg == 1
      if moji == 1
        @ubgs = User.where("name LIKE ?","#{params[:keyword]}")
      elsif moji == 2
        @ubgs = User.where("name LIKE ?","#{params[:keyword]}%")
      elsif moji == 3
        @ubgs = User.where("name LIKE ?","%#{params[:keyword]}")
      else
        @ubgs = User.where("name LIKE ?","%#{params[:keyword]}%")
      end

    elsif @ubg == 2

      if moji == 1
        @ubgs = Book.where("title LIKE ?","#{params[:keyword]}")
      elsif moji == 2
        @ubgs = Book.where("title LIKE ?","#{params[:keyword]}%")
      elsif moji == 3
        @ubgs = Book.where("title LIKE ?","%#{params[:keyword]}")
      else
        @ubgs = Book.where("title LIKE ?","%#{params[:keyword]}%")
      end

    else

      if moji == 1
        @ubgs = Group.where("name LIKE ?","#{params[:keyword]}")
      elsif moji == 2
        @ubgs = Group.where("name LIKE ?","#{params[:keyword]}%")
      elsif moji == 3
        @ubgs = Group.where("name LIKE ?","%#{params[:keyword]}")
      else
        @ubgs = Group.where("name LIKE ?","%#{params[:keyword]}%")
      end

    end
  end

end
