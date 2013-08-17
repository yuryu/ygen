class TemplatesetsController < ApplicationController
  before_action :set_templateset, only: [:show]
  before_action :set_my_templateset, only: [:edit, :update, :destroy]

	def new
		@templateset = Templateset.new
		@templateset.templates.build
	end
	def edit
		@templateset.templates.build
	end
	def show
	end

	def create
	    @templateset = Templateset.new(templateset_params)
	    @templateset.user = current_user

    	if @templateset.save
    		redirect_to @templateset, notice: 'Templateset was successfully created.'
   		else
	      	render action: 'new'
    	end

	end

	def update
	    if @templateset.update(templateset_params)
      		redirect_to @templateset, notice: 'Templateset was successfully updated.'
	    else
      		render action: 'edit'
	    end
	end

	def destroy
		user = @templateset.user
	    @templateset.destroy
	    redirect_to user_path(user), notice: 'User was successfully destroyed.'
	end

	private
		def set_templateset
			@templateset = Templateset.find(params[:id])
		end

		def set_my_templateset
			@templateset = current_user.templatesets.find(params[:id])
		end

	    def templateset_params
      		params.require(:templateset).permit(:name, templates_attributes: [:id, :format, :_destroy])
    end

end
