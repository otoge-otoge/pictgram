class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to(root_path, {success: '登録が完了しました',status: :ok})
    else
      flash.now[:danger] = "登録に失敗しました" #:dengerに"登録に失敗しました"を代入（ハッシュになってる）ApplicationControllerのadd_flash_types :success, :info, :warning, :danger
      render :new #:newは"new"でもOK　new.html.erbを呼び出す
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation) #new.html.erbのフォームにつながっている
  end
end
