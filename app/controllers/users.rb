enable :sessions
use Rack::Flash, :sweep => true

get '/login' do
    erb :login
end

get '/signup' do
    erb :signup
end

get '/logout' do
    session.clear
    redirect to ('/')
end

# get '/transit' do
#     if request.path_info == "/login"
#         redirect to('/portal')
#     elsif request.path_info == "/signup"
#         redirect to('/login')
#     end
# end

post '/login' do
 @user = User.authenticate(params[:user][:email], params[:user][:password])
 if @user
    session[:user_id] = @user.id
    # redirect to('/transit'), :notice =>'Successfully Sign In'
    redirect to('/portal')
 else
    @errors = ["Authentication failed. Pleace Check Your Details"]
    redirect to('/login')
 end
end


post '/signup' do
    usr = User.find_by(email: params[:user][:email])
    if usr.nil?
        @user = User.create(params[:user])
        redirect to ('/login')
    else
        @errors = ["Email is already in the system. Try another email"]
        redirect to('/signup')
    end
end

get '/portal' do
    if session[:user_id]
        user = User.find(session[:user_id])
        @Fname = user.first_name
        @Lname = user.last_name

    erb :portal

    else
    @errors = ["You must be logged in to view your dashboard portal. Please login!"]
    erb :login
    end
end