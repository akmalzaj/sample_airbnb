get '/new-property' do
    erb :newProperty
end

post '/add-new-property' do
	current_user
	@property = Property.create(params[:property])
	@tag = Tag.create(params[:tag])
	# byebug
	# @tag_array = @tag.split("/\W+/")
	erb :portal, :notice =>'Successfully Adding New Property'
end

# post '/new_property' do
  
#   current_user
#   @title = params[:title]
#   @description = params[:description]
#   @user_id = @current_user.id
#   @price = params[:price]
#   @bed = params[:bed]
#   @bathroom = params[:bathroom]
#   @tags = params[:tags].split(", ")

#   @new_property = Property.new(title: @title, description: @description, bed: @bed, bathroom: @bathroom, price: @price, user_id: @user_id)

#   @new_property.save
#   if @new_property.save

#     @tags.each do |tag|
#       @tag = Tag.find_or_create_by(name: tag)
#       @tag.properties << @new_property
#     end

#     @current_user.properties << @new_property

#     @flag = "Your property has been created!"
#     erb :index
#   else
#     @flag = "Fields cannot be empty!"
#     erb :new_property
#   end
# end
