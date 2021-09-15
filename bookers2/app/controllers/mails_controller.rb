class MailsController < ApplicationController

  def new
    @mail = Mail.new
  end

  def create
    @group = Group.find(params[:group_id])
    @mail = Mail.new(mail_params)
    @mail.group_id = @group.id
    if @mail.save
      flash[:notice] = "送信が完了しました"
      redirect_to group_mail_path(group_id: @group.id, id: @mail.id)
    else
      render :new
    end
  end

  def show
    @mail = Mail.find(params[:id])
  end

  private

  def mail_params
    params.require(:mail).permit(:title, :content)
  end


end
