class EntriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@entries = Entry.all.order("created_at desc").paginate(page: params[:page], per_page: 5)
	end

	def show
		@entry = Entry.friendly.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def edit
		@entry = Entry.friendly.find(params[:id])
	end

	def create
		@entry = Entry.new(entry_params)
 
		if @entry.save
			redirect_to @entry
		else
			render 'new'
		end
	end

	def update
		@entry = Entry.friendly.find(params[:id])

		if @entry.update(entry_params)
			redirect_to @entry
		else
			render 'edit'
		end
	end

	def destroy
		@entry = Entry.friendly.find(params[:id])
		@entry.destroy

		redirect_to entries_path
	end


	private

		def entry_params
			params.require(:entry).permit(:title, :date, :image, :content, :slug)
		end

end
