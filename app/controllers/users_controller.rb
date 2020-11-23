class UsersController <ApplicationController
skip_before_action :verify_user_is_authenticated

def new
@user = User.new
end

def create
@user = User.new(user_params)
if @user.valid?
  @user.save
  session[:user_id] = @user.id
else
  redirect_to '/'
end
end
 def home
 end
def show
  if User.find_by(id: params[:id]) && session[:user_id]
    @user = User.find_by(id: params[:id])
    render :show
  end
end

  def edit
    @user = User.find(params[:id])
  end

def destroy
  session.delete :name
  redirect_to '/'
end

private

def user_params
  params.require(:user).permit(:name,:nausea,:happiness,:tickets,:height,:admin,:password)

end
end
